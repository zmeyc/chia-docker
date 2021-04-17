# chia-docker

Docker scripts for Chia Network.

## Typical usage

Create an `.env` file and specify a tag or a branch name or a *short* commit hash. It is important to use a short hash, because it will be used in image name.

For example, to install v1.0.5, `.env` should contain:

```
TAG=1.0.5
```

Run:

```
./docker-build-cli.sh
```

This will create an image named `chia:1.0.5`.

Use the image:

```
./docker-chia.sh init
./docker-chia.sh configure --log-level INFO
./docker-chia.sh configure --upnp false
./docker-chia-shell.sh
```

In shell:

```
chia start farmer
```

All files will be stored in `.docker-home-{image_tag}` dir.

## Mounting drives with plots

The scripts mount `.docker-mnt` dir if it's present as `/mnt` in container, so just link it to actual `/mnt`:

```
ln -s /mnt .docker-mnt
```

## GUI support

GUI can be built, but is not yet usable from web browser.

To build GUI, add to `.env` file:

```
WITH_GUI=1
WITH_ELECTRON=1
```

## Using multiple configuration files

To use a different `.env` file, pass it's name in `ENV` environment variable:

```
ENV=.env-1.0.4 ./docker-build.sh
ENV=.env-1.0.4 ./docker-chia.sh init
# and so on
```

It's also possible to use environment variables directly:

```
TAG=1.0.5 ./docker-build.sh
```

Environment variables take precedence over variables specified in `.env` file.

## Building a third-party fork

To use a fork, add Github username or organization name to `.env` file:

```
ORG=zmeyc
TAG=1.0.4
```

This will clone `https://github.com:zmeyc/chia-blockchain.git`.

If a fork needs to be built from source code, add build tools as well:

```
ORG=zmeyc
TAG=phase1-lock-1.0.4
WITH_BUILD_TOOLS=1
```

