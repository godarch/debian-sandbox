#!/usr/bin/env bash

. ./.vars.sh

chroot $ROOTFS update-initramfs -u

# https://stackoverflow.com/questions/6710555/how-to-use-qemu-to-run-a-non-gui-os-on-the-terminal

rm -f $ROOTIMG
virt-make-fs \
    --format qcow2 \
    --size +1G \
    --type ext2 \
    "$ROOTFS" \
    "$ROOTIMG"