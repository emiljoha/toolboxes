#!/usr/bin/env bash
set -x
podman build -t $1 $1
podman rm --force $1
toolbox create -i localhost/$1 $1
