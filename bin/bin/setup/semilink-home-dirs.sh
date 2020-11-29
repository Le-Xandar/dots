#!/bin/bash
#Install.sh


DIR=/home/data

HOMEDIRS=(
	"Downloads"
	"Documents"
	"Desktop"
	"Pictures"
	"Videos"
	"VMs"
	"code"
	"Sync"
	".gnupg"
	".mozilla"
	".thunderbird"
	".emacs.d"
	".ssh"
	".telega"

	#files
	".gitconfig"

)

for homedir in "${HOMEDIRS[@]}";do
	rm -rf "${HOME}/${homedir}"
	echo "$homedir is being symlinked"
	ln -sf "${DIR}/${homedir}" "${HOME}/${homedir}"
done
