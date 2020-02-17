from click import pass_context
# from click_plugins import with_plugins
import click
# from .terraform import install_terraform
import terraform


@click.group()
@pass_context
def main(context):
    pass


@main.command()
@click.argument('cloud')
def init(cloud):
    click.echo("TCP Init {}".format(cloud))
    terraform.install_terraform()


if __name__ == "__main__":
    main()
