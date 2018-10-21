#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
ROOTFS=$DIR/rootfs
ROOTIMG=$DIR/rootfs.squashfs
BOOTFS=$DIR/boot
BOOTIMG=$DIR/boot.ext2.qcow2