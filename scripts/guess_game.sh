#!/bin/bash

# Game for guessing a previously set number.

echo "Guess game" 
echo "in 5 steps only."
echo ""

random_number=$(shuf -i1-10 -n1)

declare -i guess_num

for i in {1..5}; do 
    read -r -p "What is your guessed number, please ? " guess_num
    if [ "$guess_num" -eq "$random_number" ]; then
        echo "Success !"
        break
    elif [ $i -eq 5 ]; then
        echo "End, sorry you failed it was $random_number"

        break
    else
        echo "Failed for the $i !"
        continue
    fi
done