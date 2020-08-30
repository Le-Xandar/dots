#package to install from a package manager


package_manager_command="pacman -Sy --noconfirm"



#install each package with the default package manager
install_binaries()
{
	echo $@
	for i in "${@}"; do
		echo "$package_manager_command $i" | sh
		echo "test"
	done
}
git_clone() #name , link
{
	echo "Cloning $1"
	echo git clone $2 | sh &&
	echo "Cloning $1 success" || (echo "cloning $1 failed")
}

#================
#binaries install
#================
<< comment
declare -a binary_packages=('vim' 'awesome' 'ranger' 'git' 'llllll')
#-----------------------install_binaries "${binary_packages[@]}"
#================
#Git installs
#================
	mkdir -p /home/$(logname)/misc/git_repos && echo "/home/${USER}/misc/git_repos"
#Emacs
#dependinces for ubuntu and TODO Arch

emacs_deps=(
	'build-essential' 'automake' 'texinfo' 'libjpeg-dev' 'libncurses5-dev'
	 'libtiff5-dev' 'libgif-dev' 'libpng-dev' 'libxpm-dev' 'libgtk-3-dev' 'libgnutls28-dev' 
	)
#build emacs from source
install_binaries "$emacs_deps[@]"
cd /home/$(logname)/misc/git_repos &&
	git clone -b master git://git.sv.gnu.org/emacs.git &&
	cd emacs &&
	./autogen.sh &&
	./configure --with-mailutils &&
	make &&
	make install &&
	figlet "Emacs Built succesfully"
	echo "Emacs installed"
	#Install Doom distro
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d &&
	yes y | ~/.emacs.d/bin/doom install
comment

#awesome wm config install
mkdir -p /home/$(logname)/.config/awesome/ &&
	cd /home/$(logname)/.config/awesome/ &&
	git_clone "awesome widgets" "https://github.com/streetturtle/awesome-wm-widgets.git"









#====================
#Configs and dot files
#====================

  #git config --global user.email "you@example.com"
  #git config --global user.name "Your Name"


git_clone "personal dot files" "https://github.com/Le-Xandar/dotfiles.git"
ln -sv /home/$(logname)/misc/awesome /home/$(logname)/.configure/awesome



