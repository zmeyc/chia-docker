# chia-docker

Docker scripts for Chia Network.

Sample usage:

```
export TAG=1.0rc7
./docker-build-cli.sh
./docker-chia.sh init
./docker-chia.sh configure --log-level INFO
```

Or:

```
TAG=dev ./docker-build-cli.sh
```

Tag is a git tag or a branch name or a short commit hash. It will be used to tag Docker image name.

To start long running processes, use shell:

```
./docker-chia-shell.sh
chia start-wallet
```

All files will be stored in `.docker-home` dir.

