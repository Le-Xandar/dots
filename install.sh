#!/bin/bash
#Install.sh


DIR=$HOME/misc/dotfiles

DOTFILES=(
	"bin"
	".bashrc"
	#".bash_profile"
	#".gitconfig"
	".profile"
	#".tmux.conf"
	#".xinitrc"
	#".config/cmus/cmus.theme"
	".config/compton.conf"
	".config/awesome/rc.lua"
	".config/awesome/awesome-wm-widgets"
	".config/picom.conf"
	".config/ranger"
	".config/kitty"
	#".config/nvim"
	#".local/share/fonts"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "${HOME}/${dotfile}"
	echo "$dotfile is being symlinked"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
