#!/usr/bin/env bash
set -e

. ./.vars.sh

rm -rf $ROOTFS

debootstrap --verbose \
	--include=linux-image-amd64 \
	stable $ROOTFS https://deb.debian.org/debian