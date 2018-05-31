#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
SHED_PKG_LOCAL_PKGCONFIG_PATH='/usr/lib/pkgconfig'
if [ -n "${SHED_PKG_LOCAL_OPTIONS[bootstrap]}" ]; then
    SHED_PKG_LOCAL_PKGCONFIG_PATH='/tools/lib/pkgconfig'
fi
# Configure
PKG_CONFIG_PATH="$SHED_PKG_LOCAL_PKGCONFIG_PATH" \
./configure --prefix=/usr &&
# Build and Install
make -j $SHED_NUM_JOBS &&
make DESTDIR="$SHED_FAKE_ROOT" install
