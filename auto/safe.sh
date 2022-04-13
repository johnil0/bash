#!/bin/bash
source ./auto/srcvar.sh
c=$x
optar=()
opt=()
mes=()
num='^[0-9]+$'

while :
do

    printf "\n@utoG \n--> "
    read opt1
    opt=(${opt1[@]})

    if [[ ${#opt[@]} -gt 1 ]]
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

                mes+=($value)
            fi
        done
    fi

    case $opt in

        q | Q)

            namear=${mes[@]}
            export namear #array of to be added
            sh ./auto/gitcommit.sh
        ;;

        p | P)

            git pull origin $BRANCH
        ;;

        "push" | "PUSH" | "Push")
            git pull origin $BRANCH &> /dev/null
            git add . &> /dev/null
            printf "\033[1;36mPUSHED\033[0m"
            git commit -m "$MESSAGE"
            git push origin $MYBRANCH &> /dev/null
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
            sh ./auto/unstage.sh
        ;;

        r | R)
            namear=${optar[@]}
            export c namear #array of to be added
            sh ./auto/restore.sh
        ;;


        "run")
            $RUN
        ;;

        d | D)
            sh ./auto/deploy.sh
        ;;

        "h" | "H" )
            sh ./auto/help.sh
        ;;

        *)
            echo -n "unknown"
        ;;
    esac

done