#!/bin/bash

# A Bash script to update all packages.
# Author: ALJI Mohamed (aka Sim4n6)

figlet "A Bash script to update all packages."

# Installation: 
# - place my scripts in /usr/local/bin
# - update 'secure_path' in /etc/sudoers

if [[ $(id -u) != 0 ]]; then 
    echo "Please, run me with sudo powers !"
    exit 1
fi

echo "[+] Update all packages v0.1"
apt-get update

echo "[+] List of upgradable packages."
apt list --upgradable
apt-get -y upgrade

echo "[+] Delete unnecessary packages."
apt autoremove