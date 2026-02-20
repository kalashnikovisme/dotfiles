#!/usr/bin/env bash

set -e

OS="$1"

if [ -z "$OS" ]; then
  if [ -f /etc/arch-release ]; then
    OS="omarchy"
  elif [ -f /etc/debian_version ]; then
    OS="ubuntu"
  fi
fi

# Normalize the OS argument to avoid common copy/paste issues
OS=$(echo "$OS" | tr '[:upper:]' '[:lower:]' | tr -d '\r\n')

# Collect sudo password for Ansible privilege escalation
read -s -p "Enter sudo password: " ANSIBLE_BECOME_PASS
echo
echo "$ANSIBLE_BECOME_PASS" | sudo -S true
export ANSIBLE_BECOME_PASS
export ANSIBLE_BECOME_PASSWORD="$ANSIBLE_BECOME_PASS"

case "$OS" in
  omarchy)
    echo 'Upgrade pacman'
    sudo pacman -Syu --noconfirm
    echo 'Install make'
    sudo pacman -S --noconfirm make
    echo 'Install ansible'
    make install_ansible_omarchy OS="$OS"
    ;;
  *ubuntu*|*debian*)
    echo 'Upgrade apt'
    sudo apt-get -y upgrade
    echo 'apt-get update'
    sudo apt-get -y update
    echo 'Install make'
    sudo apt-get install -y make
    echo 'Install ansible'
    OS="ubuntu"
    make install_ansible_ubuntu OS="$OS"
    ;;
  *)
    echo "Usage: $0 [omarchy|ubuntu]"
    exit 1
    ;;
esac

echo 'Set needed permissions for ansible'
sudo chown -R $USER ~/.ansible/
echo 'Install environment'
make install_environment OS="$OS"

if [ "$OS" != "omarchy" ]; then
  make update_neovim OS="$OS"
fi

make update_bash OS="$OS"

if [ "$OS" = "ubuntu" ]; then
  echo 'Add current user to docker group'
  sudo usermod -a -G docker $USER

  echo 'Change docker owner to current user'
  sudo chown $USER:$USER /var/run/docker.sock

  echo 'NOW, LOG OUT AND LOG BACK TO APPLY DOCKER CHANGES'
fi
