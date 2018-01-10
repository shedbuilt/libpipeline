#!/bin/bash
if [ "$SHED_BUILDMODE" == 'bootstrap' ]; then
    LIBPL_PKGCONFIG_PATH="/tools/lib/pkgconfig"
else
    LIBPL_PKGCONFIG_PATH="/usr/lib/pkgconfig"
fi
PKG_CONFIG_PATH="$LIBPL_PKGCONFIG_PATH" ./configure --prefix=/usr || exit 1
make -j $SHED_NUMJOBS || exit 1
make DESTDIR="$SHED_FAKEROOT" install || exit 1
