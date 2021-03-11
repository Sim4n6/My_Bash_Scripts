#!/bin/bash

# nombre of connected users.
# Author: ALJI Mohamed
# 

nbr_users=$(w -hu |wc -l)
declare -ri nbr_users

if [[ $nbr_users == 1 ]]; then echo "A single user: $(whoami) !";
else
echo "DANGER ! connected users are: "; 
w -hu | cut -d" " -f1
fi 
