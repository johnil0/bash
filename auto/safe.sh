#!/bin/bash


source ./auto/srcvar.sh
# echo "--- ${MYBRANCH}"
# MYBRANCH=${MYBRANCH}
# echo "+++ ${MYBRANCH}"
c=$x
optar=()
opt=()
mes=()
num='^[0-9]+$'

cc=$(git branch)
cc1=($cc)
if [[ ${cc1[11]} == "master" || ${cc1[11]} == "main" ]]
then
    if [[ ${cc1[10]} == $MYBRANCH ]]
    then
        MYBRANCH=$MYBRANCH
    else

        MYBRANCH1=${cc1[11]}
    fi
fi

while :
do

    if [[ $MYBRANCH1 == "" ]]
    then
        printf "\n@utoG(\033[1;34m${MYBRANCH}\033[0m) \n--> "
    else
        printf "\n@utoG(\033[1;34m${MYBRANCH1}\033[0m) \n--> "
    fi
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

        "pl" | "PL")
            if [[ ${mes[1]} == "" ]]
            then
                ${mes[1]}
                git pull origin $BRANCH
            else
                git pull origin ${mes[1]}
            fi
        ;;
        "ps" | "PS")

            git pull origin $MYBRANCH1
        ;;


        "push" | "PUSH" | "Push")
            # git pull origin $BRANCH &> /dev/null
            # git add . &> /dev/null
            # printf "\033[1;36mPUSHED \033[0m"
            # git commit -m "$MESSAGE"
            # git push origin $MYBRANCH &> /dev/null
            if [[ $MYBRANCH1 == "master" || $MYBRANCH1 == "main" ]]
            then
                printf "Your are currently in $MYBRANCH1 branch, still you want to fast push? (y/n)"
                read -n1 -r fpp
                if [[ $fpp == "y"  ]]
                then
                    namear=${optar[@]}
                    namear1=${mes[@]}
                    export c namear namear1 #array of to be added
                    sh ./auto/fastpush.sh
                    optar=()
                fi
            else
                namear=${optar[@]}
                namear1=${mes[@]}
                export c namear namear1 #array of to be added
                sh ./auto/fastpush.sh
                optar=()
            fi
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

            while :
            do
                printf "\033[0;31m Stopping...\033[0m"
                sleep 1
                printf "\033[0;31m Stopped!\033[0m"
                break
            done

        ;;

        # d | D)
        #     sh ./auto/deploy.sh
        # ;;
        w)
            cc=$(git branch)

            cc1=($cc)

            for value in $cc
            do
                echo $value
            done
            if [[ ${cc1[11]} == "master" || ${cc1[11]} == "main" ]]
            then
                if [[ ${cc1[10]} == $MYBRANCH ]]
                then
                    echo "You are in $MYBRANCH branch."
                else
                    echo "You are in the MASTER branch."
                fi
            fi
        ;;

        "d" | "D")
            printf "cd /var/www/html/pcims-be-annex4 \n"
            printf "bash deploy.sh \n"
            ssh ${SSH}
        ;;

        "h" | "H")
            sh ./auto/help.sh
        ;;

        "b" | "B")
            printf "Switching to \033[1;34m${mes[1]}\033[0m... \n"
            chk=$(git checkout ${mes[1]})
            export MYBRANCH1=${mes[1]}
        ;;


        "g" | "G")
            while :
            do
                printf "\033[1;31m ---------Git Commands---------- \n\033[0m" ; read -r gitt;

                if [[ $gitt == 'x' ]]
                then
                    printf "\033[1;31m ---------Exit Git---------- \n\033[0m"
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