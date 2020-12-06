#!/bin/bash
validPws=0

validateOldPolicy() {
    onlyPolicyCharacters=${password//[^$letter]/}
    if [[ $number1 -le ${#onlyPolicyCharacters} && ${#onlyPolicyCharacters} -le $number2 ]]; then
        (( validPws++ ))
        echo valid PW: $password with ${#onlyPolicyCharacters} ${letter} characters and input line \"$line\"
    fi
}

validateNewPolicy() {
    char1=${password:$number1-1:1}
    char2=${password:$number2-1:1}
    [ "$char1" == "$letter" ]
    char1Matches=$?
    [ "$char2" == "$letter" ]
    char2Matches=$?
    if (( $char1Matches ^ $char2Matches )); then
        (( validPws++ ))
        echo valid PW: $password with $letter at position $([ $char1Matches -eq 0 ] && echo "$number1 but not at $number2" || echo "$number2 but not at $number1")
    fi
}

while read line; do
    number1=${line%%-*}
    number2=${line%% *}
    number2=${number2##*-}
    letter=${line%%:*}
    letter=${letter##* }
    password=${line##* }
    validateNewPolicy
done < input

echo $validPws