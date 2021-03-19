#!/bin/bash

# Game of guessing the random number.

echo "Guess game" 
echo "in 5 steps only."
random_number=$(shuf -i1-10 -n1)

for i in {1..5}; do 
    read -p "What is your guessed number, please ? " guess_num
    if [ $guess_num -eq $random_number ]; then
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