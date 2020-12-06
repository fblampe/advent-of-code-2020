#!/bin/bash
validPws=0

while read line; do 
    min=${line%%-*}
    max=${line%% *}
    max=${max##*-}
    letter=${line%%:*}
    letter=${letter##* }
    password=${line##* }
    onlyPolicyCharacters=${password//[^$letter]/}
    if [[ $min -le ${#onlyPolicyCharacters} && ${#onlyPolicyCharacters} -le $max ]]; then
        (( validPws++ ))
        echo valid PW: $password with ${#onlyPolicyCharacters} ${letter} characters and input line \"$line\"
    fi
done < input

echo $validPws