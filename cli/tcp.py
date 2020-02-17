import click


@click.command()
@click.argument('name')
@click.option('--greeting', '-g')
def main(name, greeting):
    click.echo("{}, {}".format(greeting, name))


@click.command()
@click.argument('cloud')
def init(cloud):
    click.echo("TCP Init {}".format(cloud))


if __name__ == "__main__":
    main()
