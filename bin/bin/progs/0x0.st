#!/bin/sh
[ ! -z "$1" ] && file=$1 || file=$(find . -maxdepth 2 -type f | fzf)
[ -z "$file" ] && exit
echo "file=@$file"
curl -F "file=@$file" 0x0.st | xclip -sel clip
