import os
import shutil
# import boto3
# import urllib
import mimetypes
from urllib import request
from subprocess import check_call, call

# SOURCE_BUCKET = os.environ['source_bucket']
REPO_PATH = '/tmp/'

TERRAFORM_VERSION = '0.12.20'
TERRAFORM_WORKSPACE = 's3restricted'
TERRAFORM_CWD = os.path.join(REPO_PATH, 'terraform')
TERRAFORM_CACHE = os.path.join(TERRAFORM_CWD, '.terraform')
TERRAFORM_DIR = os.path.join('/tmp', 'terraform_%s' % TERRAFORM_VERSION)
TERRAFORM_PATH = os.path.join(TERRAFORM_DIR, 'terraform')
TERRAFORM_DOWNLOAD_URL = (
    'https://releases.hashicorp.com/terraform/{0}/terraform_{0}_darwin_amd64.zip'.format(TERRAFORM_VERSION))


def install_terraform():
    if os.path.exists(TERRAFORM_PATH):
        return

    request.urlretrieve(TERRAFORM_DOWNLOAD_URL, '/tmp/terraform.zip')
    check_call(['unzip', '-o', '/tmp/terraform.zip', '-d', TERRAFORM_DIR])
    check_call([TERRAFORM_PATH, 'version'])


# basically returns a list of a all files in the branch
def get_blob_list(codecommit, repository, branch):
    response = codecommit.get_differences(
        repositoryName=repository,
        afterCommitSpecifier=branch,
    )
    blob_list = [difference['afterBlob'] for difference in response['differences']]
    while 'nextToken' in response:
        response = codecommit.get_differences(
            repositoryName=repository,
            afterCommitSpecifier=branch,
            nextToken=response['nextToken']
        )
        blob_list += [difference['afterBlob'] for difference in response['differences']]
    return blob_list


# def codecommit_to_s3(event, bucket):
#     repository_name = event['Records'][0]['eventSourceARN'].split(':')[5]
#     region_name = event['Records'][0]['awsRegion']
#     branch = event['Records'][0]['codecommit']['references'][0]['ref'].split('/')[-1]
#     commit_id = event['Records'][0]['codecommit']['references'][0]['commit']
#     print("Pulling %s \nbranch %s \ncommit %s" % (repository_name, branch, commit_id))
#
#     codecommit = boto3.client('codecommit', region_name=region_name)
#
#     # reads each file in the branch and uploads it to the s3 bucket
#     for blob in get_blob_list(codecommit, repository_name, branch):
#         path = blob['path']
#         content = (codecommit.get_blob(repositoryName=repository_name, blobId=blob['blobId']))['content']
#
#         # we have to guess the mime content-type of the files and provide it to S3 since S3 cannot do this on its own.
#         content_type = mimetypes.guess_type(path)[0]
#         if content_type is not None:
#             bucket.put_object(Body=content, Key=path, ContentType=content_type)
#         else:
#             bucket.put_object(Body=content, Key=path)


# def get_sources(event):
#     if os.path.exists(REPO_PATH):
#         print('Truncating %s...' % REPO_PATH)
#         shutil.rmtree(REPO_PATH)
#
#     bucket = boto3.resource('s3').Bucket(SOURCE_BUCKET)
#     codecommit_to_s3(event, bucket)
#
#     for obj in bucket.objects.all():
#         key_string = str(obj.key)
#         parent_path = '/'.join(key_string.split('/')[:-1])
#         parent_path = os.path.join(REPO_PATH, parent_path)
#         if not os.path.exists(parent_path):
#             os.makedirs(parent_path)
#
#         filename = key_string.split('/')[-1:][0]
#         absolute_path = os.path.join(parent_path, filename)
#         bucket.download_file(obj.key, absolute_path)
#         bucket.delete_objects(Delete={'Objects': [{'Key': obj.key}]})
#         # print(absolute_path)
#         check_call(['cksum', absolute_path])


def terraform_init():
    # TODO might be better to always clean .terraform if exist
    if not os.path.exists(TERRAFORM_CACHE):
        print('Terraform Init...')
        check_call([TERRAFORM_PATH, 'init', '-no-color'], cwd=TERRAFORM_CWD)

    check_call([TERRAFORM_PATH, 'workspace', 'select', TERRAFORM_WORKSPACE, '-no-color'], cwd=TERRAFORM_CWD)


def terraform_plan():
    print('Terraform Plan...')
    return call([TERRAFORM_PATH, 'plan', '-out', 'tfplan', '-no-color', '-detailed-exitcode'],
                cwd=TERRAFORM_CWD)


def terraform_apply(exitcode):
    if exitcode == 0:
        # Succeeded
        pass
    elif exitcode == 1:
        # Error
        pass
    elif exitcode == 2:
        # Succeeded, Diff
        print('Terraform Apply...')
        check_call([TERRAFORM_PATH, 'apply', 'tfplan', '-no-color'], cwd=TERRAFORM_CWD)


def lambda_handler(event, context):
    install_terraform()
    # get_sources(event)
    # terraform_init()
    # exitcode = terraform_plan()
    # terraform_apply(exitcode)
