#!/usr/bin/env bash

. ./.vars.sh

cp $DIR/darch $ROOTFS/usr/share/initramfs-tools/scripts/darch
chroot $ROOTFS update-initramfs -u

# https://stackoverflow.com/questions/6710555/how-to-use-qemu-to-run-a-non-gui-os-on-the-terminal

rm -rf $BOOTFS
mkdir -p $BOOTFS/image/dir
cp $ROOTIMG $BOOTFS/image/dir
virt-make-fs \
    --format qcow2 \
    --size +1G \
    --type ext2 \
    "$BOOTFS" \
    "$BOOTIMG"

#99488d94-246a-4659-89c5-9ca84976f8b6