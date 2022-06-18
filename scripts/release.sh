#!/bin/bash

SCRIPT_PATH=$(realpath $0)
BASE_DIR=$(dirname $SCRIPT_PATH)
ROOT_DIR=$BASE_DIR/..
BUILD_DIR=$ROOT_DIR/build
BIN_PATH=$BUILD_DIR/randpass
RELEASE_DIR=$ROOT_DIR/releases

build() {
  echo "Building binary"
  cd $ROOT_DIR
  make
  echo
}

release() {
  PLATFORM=$1
  cd $ROOT_DIR
  mkdir -p releases
  VERSION=$(build/randpass --version | cut -d " " -f 2)
  OUT_PATH="$RELEASE_DIR/randpass-$VERSION-$PLATFORM-amd64.tar.xz"
  SHA_PATH="$RELEASE_DIR/randpass-$VERSION-$PLATFORM-amd64.tar.xz.sha256"

  echo "Building release for version $VERSION"
  echo
  if [ -f $OUT_PATH ]; then
    echo "Release already exists, deleting it... "
    rm -f $OUT_PATH
  fi
    if [ -f $SHA_PATH ]; then
    echo "Hash already exists, deleting it... "
    rm -f $SHA_PATH
  fi
  echo

  echo "Archiving binary ..."
  cd $BUILD_DIR
  tar cfJ $OUT_PATH *
  if [ $? -eq 0 ]; then
    echo "Created file: $OUT_PATH"
    echo "Size: $(ls -lh $OUT_PATH | awk '{printf $5}')"
  else
    echo "Failed to create archive."
    exit 1
  fi
  cd $BASE_DIR
  echo

  echo "Generating SHA-256"
  SHA_VAL=$(shasum -a 256 $OUT_PATH | awk '{printf $1}')
  echo "For reference, the hash is:"
  echo $SHA_VAL
  echo
  echo $SHA_VAL > $SHA_PATH
  if [ -f $SHA_PATH ]; then
    echo "Created file: $SHA_PATH"
  fi
  echo
}

tag_repo() {
  echo "Don't forget to tag the release and push it:"
  echo "  git tag -a "v$VERSION" -m \"Tagged v$VERSION\""
  echo "  git push origin --tags"
  echo
}

if [ $# -eq 1 ]; then
  build && release $1 && tag_repo
  echo "Done."
  echo
else
  echo "Usage: release.sh platform"
fi
