#!/usr/bin/env bash

PACKAGE_VERSION=$(jq '.version' -r package.json)
if [ "$PACKAGE_VERSION" != "0.0.1-snapshot" ] ; then
  LINE=$(grep -n '"version":' package.json | cut -d: -f1)
  echo "::error file=package.json,line=${LINE}::Package version must always be \"0.0.1-snapshot\" in source control." >> /dev/stderr
  exit 1
fi

PACKAGE_PRIVATE=$(jq '.private' -r package.json)
if [ "$PACKAGE_PRIVATE" == "true" ] ; then
  LINE=$(grep -n '"private":' package.json | cut -d: -f1)
  echo "::error file=package.json,line=${LINE}::Package is marked private, so cannot be published" >> /dev/stderr
  exit 1
fi
