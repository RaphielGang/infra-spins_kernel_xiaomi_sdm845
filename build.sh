#!/usr/bin/env sh
#
# Copyright (C) 2019 Raphielscape LLC.
#
# Licensed under the Raphielscape Public License, Version 1.c (the "License");
# you may not use this file except in compliance with the License.
#
# Docker infra build script

## Variables
repo=spinsinfra
tag=fedora

docker build . -t raphielscape/$repo:$tag
echo "$OWO" | docker login -u raphielscape --password-stdin > /dev/null 2>&1
docker push raphielscape/$repo