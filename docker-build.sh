#!/usr/bin/env bash
[[ -d static ]] && rm -rf static
DOCKER_BUILDKIT=1 docker build . --output static
