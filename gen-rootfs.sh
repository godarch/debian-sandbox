#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
ROOTFS=$DIR/rootfs

rm -rf $ROOTFS

export http_proxy=http://127.0.0.1:8000
debootstrap --verbose \
	--include=linux-image-amd64,grub-pc \
	stable $ROOTFS http://deb.debian.org/debian