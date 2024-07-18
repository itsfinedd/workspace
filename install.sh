#!/bin/sh

if [ $(id -u) == 0 ]; then
	echo "This script must not be run as root user"
	exit 1
fi

dependences=(alacritty bspwm sxhkd lsd bat zsh polybar rofi picom xclip ttf-jetbrains-mono-nerd net-tools \
	papirus-icon-theme zsh-autosuggestions zsh-history-substring-search zsh-completions zsh-syntax-highlighting lightdm lightdm-gtk-greeter \
	noto-fonts-cjk ttf-nerd-fonts-symbols ttf-liberation feh)
echo "Installing Pacman packages"
for package in ${dependences[@]}; do
	sudo pacman -S $package --noconfirm 2>>error.log
	sleep 1
done

sleep 5

echo "Installing AUR packages"
aurdependences=(bibata-cursor-theme zsh-sudo zsh-theme-powerlevel10k-git dracula-gtk-theme)

for aurpackage in ${aurdependences[@]}; do
	yay -S $aurpackage --noconfirm
	sleep 1
done
sleep 5

if [ ! -e $HOME/.config ]; then
	mkdir $HOME/.config
	echo "The .config directory was created"
else
	echo -e "The .config directory already exists\nSkipping..."
fi

echo "Copying files to .config"

cp -rf config/* $HOME/.config/ 2>> error.log
cp -f home/.zshrc $HOME/.zshrc 2>> error.log

echo "Copying files to home directory"

cp -f home/.p10k.zsh $HOME/.p10k.zsh 2>> error.log
cp -rf home/.wallpapers $HOME/.wallpapers 2>> error.log

echo "Creating symlinks to root"

sudo ln -sf $HOME/.zshrc /root/.zshrc 2>> error.log
sudo ln -sf $HOME/.p10k.zsh /root/.p10k.zsh 2>> error.log

echo "Installing zsh"
if [[ $SHELL != "/usr/bin/zsh" ]]; then
	echo "Changing shell to zsh"
	chsh -s /usr/bin/zsh
	sudo chsh -s /usr/bin/zsh
	echo "Shell changed to zsh"
fi

echo "Activating the display manager Lightdm"
systemctl enable lightdm
echo "Intallation finished, please reboot your system"
