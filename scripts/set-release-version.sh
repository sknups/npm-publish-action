#!/usr/bin/env bash

set -e

VERSION=${GITHUB_REF_NAME#v}

npm version "$VERSION" --no-git-tag-version
