#!/bin/bash

# nombre of connected users.
# Author: ALJI Mohamed
# 
figlet "Nombre of connected users : NOW!"

declare -a logged_in_users
logged_in_users=( "$(w -hu | cut -d" " -f1)" );


if [[ ${#logged_in_users[*]} == 1 ]]; then echo "A single user: $(whoami) !";
else
echo "DANGER ! ${#logged_in_users[*]} are connected right now ! "; 
for ((i=0; i<${#logged_in_users[*]}; i++)) do
    echo "${logged_in_users[i]}"
done
fi 

