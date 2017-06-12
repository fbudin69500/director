#!/bin/bash
set -e

root_dir=$(cd $(dirname $0)/../.. && pwd)

UBUNTU_TEST_VERSION=${UBUNTU_TEST_VERSION:-16}
MAKE_PACKAGE=${MAKE_PACKAGE:-OFF}
MAKE_DOCS=${MAKE_DOCS:-OFF}
USE_LCM=${USE_LCM:-OFF}
USE_LIBBOT=${USE_LIBBOT:-OFF}
USE_LCMGL=${USE_LCMGL:-OFF}
TRAVIS_OS_NAME=${TRAVIS_OS_NAME:-linux}
TRAVIS_BUILD_DIR=${TRAVIS_BUILD_DIR:-/root}
TRAVIS_PULL_REQUEST=${TRAVIS_PULL_REQUEST:-false}

docker build -f $root_dir/distro/travis/ubuntu${UBUNTU_TEST_VERSION}.dockerfile \
  --build-arg MAKE_PACKAGE=${MAKE_PACKAGE} \
  --build-arg MAKE_DOCS=${MAKE_DOCS} \
  --build-arg USE_LCM=${USE_LCM} \
  --build-arg USE_LIBBOT=${USE_LIBBOT} \
  --build-arg USE_LCMGL=${USE_LCMGL} \
  --build-arg TRAVIS_OS_NAME="$TRAVIS_OS_NAME" \
  --build-arg TRAVIS_BRANCH="$TRAVIS_BRANCH" \
  --build-arg TRAVIS_BUILD_DIR="$TRAVIS_BUILD_DIR" \
  --build-arg TRAVIS_PULL_REQUEST="$TRAVIS_PULL_REQUEST" \
  --build-arg TRAVIS_PULL_REQUEST_BRANCH="$TRAVIS_PULL_REQUEST_BRANCH" \
  --build-arg TRAVIS_PULL_REQUEST_SHA="$TRAVIS_PULL_REQUEST_SHA" \
  --build-arg encrypted_444f3458e047_key="$encrypted_444f3458e047_key" \
  --build-arg encrypted_444f3458e047_iv="$encrypted_444f3458e047_iv" \
  --build-arg encrypted_copyfiles_host="$encrypted_copyfiles_host" \
  $root_dir
