#!/bin/bash
#Install.sh


DIR=/home/data/

HOMEDIRS=(
	"Downloads"
	"Documents"
	"Desktop"
	"Pictures"
	"Videos"
	"code"
	"Sync"
	".gnupg"
	".mozilla"
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
