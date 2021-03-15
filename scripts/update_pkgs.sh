#!/bin/bash

# A Bash script to update all packages.
# Author: ALJI Mohamed (aka Sim4n6)

figlet "A Bash script to update all packages."

# Installation: 
# - place my scripts in /usr/local/bin
# - update 'secure_path' in /etc/sudoers

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

if [[ $(id -u) != 0 ]]; then 
    echo -e "${RED}[-]${NC} Please, run me with sudo powers !"
    exit 1
fi

echo -e -n "${GREEN}[+]${NC} Checking connectivity to internet... "
if ! ping -c 3 8.8.8.8 &> /dev/null; then 
    echo ""
    echo -e "${RED}[-]${NC} Connectivity problem, please, check your connection."
    exit 2
else
    echo "OK"
fi

echo -e "${GREEN}[+]${NC} Update all packages v0.1"
apt-get update

echo -e "${GREEN}[+]${NC} List of upgradable packages."
apt list --upgradable
apt-get -y upgrade

echo -e "${GREEN}[+]${NC} Delete unnecessary packages."
apt autoremove

exit 0