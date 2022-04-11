#!/bin/bash
c=$x
optar=()
opt=()
mes=()
num='^[0-9]+$'
while :
do

    printf "\n@utoGsafe \n-->"
    read opt1
    opt=(${opt1[@]}) # make the inputed an array

    if [[ ${#opt[@]} -gt 1 ]] #aray check
    then
        mes=()
        if [[ ${opt[1]} != "." ]]
        then
            opt=${opt[0]}
        else
            opt="${opt[0]} ."
        fi
        for value in "${opt[@]}"
        do
            if [[ $value =~ $num ]]
            then

                optar+=($value)
            else
                echo ">> $value"
                mes+=($value)
            fi
        done
    fi
    echo "-- ${mes[@]}"
    case $opt in

        q | Q)
            git commit -m "."
        ;;

        c | C)
            clear
        ;;

        s | S)
            sh ./auto/gitstatus.sh

        ;;

        "u ." | "U .")
            git restore --staged .
            printf "\033[1;32m Everything was UNSTAGED. \033[0m"
        ;;

        a | A)

            namear=${optar[@]}
            export c namear #array of to be added
            sh ./auto/gitadd.sh
        ;;

        "a ." | "A .")
            git add . &> /dev/null
            printf "\033[1;32m Everything was STAGED. \033[0m"
        ;;


        u | U)
            namear=${optar[@]}
            export c namear #array of to be added
            sh ./auto/gitrestore.sh
        ;;


        "qwe")
            git status
        ;;

        "run")
            npm run dev
        ;;

        *)
            echo -n "unknown"
        ;;
    esac

done