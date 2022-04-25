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
            # git pull origin $BRANCH &> /dev/null
            # git add . &> /dev/null
            # printf "\033[1;36mPUSHED \033[0m"
            # git commit -m "$MESSAGE"
            # git push origin $MYBRANCH &> /dev/null
            namear=${optar[@]}
            namear1=${mes[@]}
            export c namear namear1 #array of to be added
            sh ./auto/fastpush.sh
            optar=()
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
            optar=()
        ;;

        "a ." | "A .")
            git add . &> /dev/null
            printf "\033[1;32m Everything was STAGED. \033[0m"
        ;;


        u | U)
            namear=${optar[@]}
            export c namear #array of to be added
            sh ./auto/unstage.sh
            optar=()
        ;;

        r | R)
            namear=${optar[@]}
            export c namear #array of to be added
            sh ./auto/restore.sh
            optar=()
        ;;

        "r ." | "R .")
            git restore . &> /dev/null
            printf "\033[1;32m Everything was RESTORED. \033[0m"
        ;;


        "run")
            $RUN
            printf "\033[0;31m Stopping...\033[0m"

            sleep 1
            printf "\033[0;31m Stopped!\033[0m"
        ;;

        d | D)
            sh ./auto/deploy.sh
        ;;

        "dep" | "Dep")
            printf "cd /var/www/html/pcims-be-annex4 \n"
            printf "bash deploy.sh \n"
            ssh root@159.138.24.196
        ;;

        "h" | "H")
            sh ./auto/help.sh
        ;;

        "branch" | "BRANCH")
            printf "Input branch name " ; read -r commito;
            git checkout $commito
        ;;


        "git" | "GIT")
            while :
            do
                printf "\033[1;31m ---------Git Commands---------- \n\033[0m" ; read -r gitt;

                if [[ $gitt == 'break' ]]
                then
                    printf "\033[1;31m Exiting Raw Git... \n\033[0m"
                    sleep 1
                    break
                else
                    $gitt
                fi
            done
        ;;


        *)
            echo -n "unknown"
        ;;
    esac

done