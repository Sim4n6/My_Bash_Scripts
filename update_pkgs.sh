#!/bin/bash

# A Bash script to update all packages.
# Author: ALJI Mohamed (aka Sim4n6)

# Installation: 
# - place my scripts in /usr/local/bin
# - update 'secure_path' in /etc/sudoers

echo "[+] Update all packages v0.1"
apt-get update

echo "[+] List of upgradable packages."
apt list --upgradable
apt-get -y upgrade

echo "[+] Delete unnecessary packages."
apt autoremove