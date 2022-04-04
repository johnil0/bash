#!/bin/bash

while :
do

    printf "\n Enter q c s x -- safe: "
    read COUNTRY

    case $COUNTRY in

        q | Q)
            echo -n "Lithuanian"
        ;;

        c | C)
            clear
        ;;

        s | S)
            sh ./gitstatus.sh
        ;;

        x | X)
            git restore --staged .
        ;;

        a | A)
            git add .
        ;;


        qwe)
            git status
        ;;

        x)
            break
        ;;

        *)
            echo -n "unknown"
        ;;
    esac

done