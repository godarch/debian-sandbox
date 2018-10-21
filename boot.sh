#!/usr/bin/env bash

. ./.vars.sh

# echo	'Loading Linux linux ...'
# linux	darch_dir=UUID=a85bf1c9-59a1-4dba-9df9-6fbbfa03466c:/var/lib/darch/stage/live/h42milg9c1r2jqr02ch8q1r3x
# echo	'Loading initial ramdisk ...'


qemu-system-x86_64 \
    --enable-kvm \
    --initrd $ROOTFS/boot/initrd.img-4.9.0-7-amd64 \
    --kernel $ROOTFS/boot/vmlinuz-4.9.0-7-amd64 \
    --append "console=ttyS0 debug root=sdfgdfg break=darch boot=darch darch_dir=/dev/sda:/image/dir darch_rootfs=rootfs.squashfs" \
    --serial mon:stdio \
    --drive "file=$BOOTIMG,format=qcow2"