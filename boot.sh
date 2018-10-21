#!/usr/bin/env bash

. ./.vars.sh

qemu-system-x86_64 \
    --enable-kvm \
    --initrd $ROOTFS/boot/initrd.img-4.9.0-7-amd64 \
    --kernel $ROOTFS/boot/vmlinuz-4.9.0-7-amd64 \
    --append "console=ttyS0 root=/dev/sda debug" \
    --serial mon:stdio \
    --drive "file=$ROOTIMG,format=qcow2"