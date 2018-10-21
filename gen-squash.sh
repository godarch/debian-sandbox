#!/usr/bin/env bash

. ./.vars.sh

rm $ROOTIMG
mksquashfs $ROOTFS $ROOTIMG