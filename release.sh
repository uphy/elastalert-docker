#!/bin/bash

if [ $# != 1 ]; then
  echo specify a version to release.
  exit 1
fi

VERSION=$1
echo $VERSION | grep "^v.*" > /dev/null
if [ $? == 0 ]; then
  echo "the prefix 'v' is not required."
  exit 1
fi

sed -i '' -e "s/^ARG VERSION=.*$/ARG VERSION=v$VERSION/" Dockerfile
sed -i '' -e "s@uphy/elastalert:.*@uphy/elastalert:$VERSION@" README.md
git add .
git commit -m "Upgraded to $VERSION."
git tag -am "Releases $VERSION." "$VERSION"
git push origin master
git push --tags
