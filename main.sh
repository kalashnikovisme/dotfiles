#!/usr/bin/env bash

set -e

OS="$1"

if [ -z "$OS" ]; then
  if [ -f /etc/arch-release ]; then
    OS="arch"
  elif [ -f /etc/debian_version ]; then
    OS="ubuntu"
  fi
fi

case "$OS" in
  arch)
    echo 'Upgrade pacman'
    sudo pacman -Syu --noconfirm
    echo 'Install make'
    sudo pacman -S --noconfirm make
    echo 'Install ansible'
    make install_ansible_arch
    ;;
  ubuntu)
    echo 'Upgrade apt'
    sudo apt-get -y upgrade
    echo 'apt-get update'
    sudo apt-get -y update
    echo 'Install make'
    sudo apt-get install -y make
    echo 'Install ansible'
    make install_ansible_ubuntu
    ;;
  *)
    echo "Usage: $0 [arch|ubuntu]"
    exit 1
    ;;
esac

echo 'Set needed permissions for ansible'
sudo chown -R $USER ~/.ansible/
echo 'Install environment'
OS=$OS make install_environment && make update_vim && make update_bash

echo 'Add current user to docker group'
sudo usermod -a -G docker $USER

echo 'Change docker owner to current user'
sudo chown $USER:$USER /var/run/docker.sock

echo 'NOW, LOG OUT AND LOG BACK TO APPLY DOCKER CHANGES'
