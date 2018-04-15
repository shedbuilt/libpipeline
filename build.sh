#!/bin/bash
if [ "$SHED_BUILD_MODE" == 'bootstrap' ]; then
    LIBPL_PKGCONFIG_PATH="/tools/lib/pkgconfig"
else
    LIBPL_PKGCONFIG_PATH="/usr/lib/pkgconfig"
fi
PKG_CONFIG_PATH="$LIBPL_PKGCONFIG_PATH" ./configure --prefix=/usr || exit 1
make -j $SHED_NUM_JOBS || exit 1
make DESTDIR="$SHED_FAKE_ROOT" install || exit 1
