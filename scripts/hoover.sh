#!/bin/bash

# Delete file based on an MD5 hash
# Author: ALJI Mohamed (aka Sim4n6)

if [ $# -eq 2 ]; then
    directory="$1"
    md5="$2"
elif [ $# -eq 1 ]; then 
    directory="$PWD"
    md5="$1"
else
    echo "[-] Correct usage is: $0 Directory MD5HASH"
    exit 1
fi

for f in "${directory}"/*; do
    f_md5=$(md5sum "$f"|cut -d" " -f1)
    if [ "$f_md5" == "$md5" ];then
        echo "The file $(basename "$f") matches the MD5 hash."
        rm -i "$f"
    fi    
done

