#!/bin/bash

# A Bash script to get http status of a http link.
# Author: ALJI Mohamed (aka Sim4n6)

if [[ $1 ]]; then 
    curl -s -o /dev/null -I -w "%{http_code}\n" -- "$1"
else
    printf "Usage:\tGet_http_code.sh www.example.com\n"
fi
