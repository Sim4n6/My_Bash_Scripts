#!/bin/bash

# nombre of connected users.
# Author: ALJI Mohamed
# 

declare -ri nbr_users=$(w -hu |wc -l)
if [[ $nbr_users == 1 ]]; then echo "A single user: You ! ";
else echo "DANGER !"; fi 
