#!/usr/bin/env bash
set -euo pipefail
HOSTUSER=u0_a149
PORT=8022
IP=192.168.100.70

fusermount -u "$HOME/Phone" && echo "Phone unmounted"
#/usr/bin/rclone mount phone: "$HOME/Phone"  --vfs-cache-mode full
sshfs "$HOSTUSER@$IP:storage" -p $PORT \
    ~/Phone -C -o follow_symlinks &&
    echo "Phone mounted succesfully" ||
    echo "couldn't mount phone"
