#!/bin/bash

# A Bash script to get http status of a http link.
# Author: ALJI Mohamed (aka Sim4n6)

curl -s -o /dev/null -I -w "%{http_code}\n" -- "$1"
