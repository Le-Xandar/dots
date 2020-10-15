#!/bin/bash
#Install.sh


DIR=/home/data/dots

DOTFILES=(
	"bin"
	".bashrc"
	#".bash_profile"
	#".gitconfig"
	".profile"
	#".tmux.conf"
	".xinitrc"
	".Xresources"
	".zshrc"
	".vimrc"
	".config/.oh-my-zsh"
	".config/bspwm"
	".config/polybar"
	".config/sxhkd"

	".config/zathura"
	".config/alacritty"
	".config/neofetch"
	".config/i3"
	".config/mpv"
	".config/screenkry.json"

	".doom.d"
	#".config/cmus/cmus.theme"
	".config/compton.conf"
	".config/picom.conf"
	".config/awesome"
	".config/picom.conf"
	".config/ranger"
	".config/kitty"
	".config/nvim"
	#".local/share/fonts"
)

for dotfile in "${DOTFILES[@]}";do
	rm -rf "${HOME}/${dotfile}"
	echo "$dotfile is being symlinked"
	ln -sf "${DIR}/${dotfile}" "${HOME}/${dotfile}"
done
