#!/bin/bash

sudo add-apt-repository -y ppa:noobslab/icons
sudo add-apt-repository -y ppa:ravefinity-project/ppa
sudo apt-get update
sudo apt-get -y install \
    vim \
    git \
    compizconfig-settings-manager \
    unity-tweak-tool \
    silversearcher-ag \
    ambiance-flat-colors \
    ultra-flat-icons

# git

git config --global core.editor vim

# vim

if [ ! -e $HOME/.vimrc ]
then

cat << 'eof' > ~/.vimrc
set nu et si sw=4 ts=4
imap kj <ESC>
syn on
color darkblue
eof

fi

# base 16

if [ ! -d $HOME/.config/base16-shell/ ]
then

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

cat << 'eof' >> ~/.bashrc
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
eof

base16_default-dark

fi

# themes and settings

gsettings set org.gnome.desktop.interface gtk-theme 'Ambiance-Flat-Aqua'
gsettings set org.gnome.desktop.interface icon-theme 'Ultra-Flat'

dconf write /org/compiz/profiles/unity/plugins/move/opacity 80
dconf write /org/compiz/profiles/unity/plugins/grid/left-edge-threshold 5
dconf write /org/compiz/profiles/unity/plugins/grid/right-edge-threshold 5
dconf write /org/compiz/profiles/unity/plugins/grid/top-edge-threshold 5
dconf write /org/compiz/profiles/unity/plugins/grid/snapoff-threshold 7
dconf write /org/compiz/profiles/unity/plugins/grid/outline-color "'#0088fb9f'"
dconf write /org/compiz/profiles/unity/plugins/grid/fill-color "'#0071fb4f'"
dconf write /org/compiz/profiles/unity/plugins/resize/border-color "'#0088fb9f'"
dconf write /org/compiz/profiles/unity/plugins/resize/fill-color "'#0071fb4f'"
dconf write /org/compiz/profiles/unity/plugins/unityshell/alt-tab-forward "'Disabled'"
dconf write /org/compiz/profiles/unity/plugins/unityshell/alt-tab-prev "'Disabled'"
dconf write /org/compiz/profiles/unity/plugins/core/active-plugins "['core', 'composite', 'opengl', 'mousepoll', 'copytex', 'grid', 'vpswitch', 'commands', 'regex', 'compiztoolbox', 'imgpng', 'place', 'animation', 'wall', 'resize', 'workarounds', 'move', 'unitymtgrabhandles', 'fade', 'expo', 'session', 'ezoom', 'scale', 'switcher', 'unityshell']"
dconf write /org/gnome/desktop/interface/cursor-size 24
dconf write /org/gnome/desktop/interface/scaling-factor 1
dconf write /org/gnome/desktop/interface/text-scaling-factor 1.0
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 16
dconf write /org/compiz/profiles/unity/plugins/expo/x-offset 32
dconf write /org/compiz/profiles/unity/plugins/unityshell/backlight-mode 3
dconf write /org/compiz/profiles/unity/plugins/unityshell/num-launchers 1
dconf write /org/compiz/profiles/unity/plugins/unityshell/edge-responsiveness 8.0
dconf write /org/compiz/profiles/unity/plugins/unityshell/overcome-pressure 1
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-hide-mode 1
dconf write /org/compiz/profiles/unity/plugins/unityshell/reveal-pressure 5
dconf write /org/compiz/profiles/unity/plugins/unityshell/autohide-animation 2
dconf write /org/compiz/profiles/unity/plugins/unityshell/panel-opacity 0.0
dconf write /org/compiz/profiles/unity/plugins/unityshell/launcher-opacity 0.05000000000000000
dconf write /org/gnome/nautilus/window-state/geometry "'890x550+34+24'"
dconf write /org/gnome/nautilus/window-state/maximized "false"
dconf write /org/compiz/profiles/unity/plugins/unityshell/background-color "'#0000003e'"
dconf write /org/compiz/profiles/unity/plugins/core/hsize 3
dconf write /org/compiz/profiles/unity/plugins/core/vsize 3
