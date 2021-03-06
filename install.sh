#!/bin/bash

#wget https://raw.githubusercontent.com/rpasta42-personal/myconfigs/master/install.sh; chmod u+x install.sh; ./install.sh

GIT_DIR_KEY=git@github.com:
GIT_DIR_HTTPS=https://github.com
GIT_DIR=$GIT_DIR_HTTPS

apt update
apt install sudo

sudo2=sudo


ALL_PKGS="vim git htop python3 python3-pip sshfs curl dstat nethogs lsof rsync"
DEV_PKGS="tmux nginx"

#PC Desktop
PCD_PKGS="terminator xmonad dmenu gedit scrot clusterssh gpick gimp vlc thunar lm-sensors"

$sudo2 apt update
$sudo2 apt -y install $ALL_PKGS
#$sudo2 apt -y install $PCD_PKGS
$sudo2 apt -y install $DEV_PKGS

sudo pip3 install --upgrade pip
sudo pip install --upgrade pip

#pip3 install --upgrade pip
$sudo2 pip3 install
$sudo2 pip3 install pyinotify #for pywatch
$sudo2 pip3 install sh #for vivie
$sudo2 pip3 install pexpect #for base-flask


mkdir -p ~/orgs/{Kosandr,rpasta42-personal}
bash -c "`echo "cd ~/orgs/rpasta42-personal; git clone $GIT_DIR/rpasta42-personal/"{mynotes.git,mysnippets.git,myconfigs.git,myutils}\;`"
cd ~/orgs/rpasta42-personal/myutils; ./setup.sh
bash -c "`echo "cd ~/orgs/Kosandr;           git clone $GIT_DIR/Kosandr/"{magic-pyjs-orm.git,utiltools.git,base-flask-skeleton.git}\;`"
cd ~/orgs/Kosandr/utiltools; make build; make install
cd ~/orgs/rpasta42-personal/myconfigs; ./setup.sh
