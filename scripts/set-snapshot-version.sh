#!/usr/bin/env bash

set -e

EPOCH=$(git log -1 --format=%ct)
VERSION="0.0.1-snapshot.${EPOCH}"

npm version "$VERSION" --no-git-tag-version
