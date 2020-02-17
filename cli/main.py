import os

from click import pass_context, option
import click
import terraform

CLI_CACHE = os.path.join(os.getcwd(), '.tkctl')


@click.group()
@pass_context
def main(context):
    pass


@main.command()
def init():

    click.echo("TKCTL Init {}".format("aws"))

    if not os.path.exists(CLI_CACHE):
        os.mkdir(CLI_CACHE)

    terraform.install_terraform()

    click.secho("TKCTL Initialized", fg='green')


@main.command()
# @option('--interactive', required=False)
def deploy():
    click.echo("deploy")
    # create vpc
    terraform.terraform_init("aws-vpc")
    terraform.terraform_plan("aws-vpc")
    continue_flag = input("Initialisation Complete Should we apply this plan: [y/n]")

    if (continue_flag == 'y'):
        click.echo("Jinx! - not implemented yet!")

    # create app


@main.command()
def destroy():
    click.echo("destroy")


if __name__ == "__main__":
    main()
