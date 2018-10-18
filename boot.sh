#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
ROOTFS=$DIR/rootfs
ROOTIMG=$DIR/rootfs.ext2.qcow2

rm -f $ROOTIMG
virt-make-fs \
    --format qcow2 \
    --size +1G \
    --type ext2 \
    "$ROOTFS" \
    "$ROOTIMG"

qemu-system-x86_64 \
    --initrd $ROOTFS/boot/initrd.img-4.9.0-7-amd64 \
    --kernel $ROOTFS/boot/vmlinuz-4.9.0-7-amd64 \
    --append "console=ttyS0 root=/dev/sda" \
    --drive "file=$ROOTIMG,format=qcow2"