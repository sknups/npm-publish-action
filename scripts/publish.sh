#!/usr/bin/env bash

set -e

npm publish

VERSION=$(jq '.version' -r package.json)
NAME=$(jq '.name' -r package.json)

{
  echo "version=${VERSION}"
  echo "name=${NAME}"
} >> "$GITHUB_OUTPUT"

echo "Published \`${NAME}\` version \`${VERSION}\` to npm repository" >> "$GITHUB_STEP_SUMMARY"
