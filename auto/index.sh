#!/bin/bash
#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

GRN='\033[1;32m'
BRK='\033[1;30m'
LP='\033[1;31m'
YELLOW='\033[1;33m'
LCYAN='\033[1;36m'
NC='\033[0m'
al=0
to=0

# 2>&1 >/dev/null &> /dev/null
printf "Pulling. . ."
pull=$(git pull origin main)
git pull origin john-dev
pullret=($pull)




for value in "${pullret[@]}"
do

    if [[ $value == "Already" ]]
    then
al=1
    fi
        if [[ $value == "to" ]]
    then
to=1
    fi
done
    if [[ $al -gt 0 && $to -gt 0 ]]
    then
    printf "\033[1;32m UP TO DATE! ${NC}"
    sleep 2
    clear
    else
    printf "\033[1;31m Something went wrong! ${NC}"
    fi

while :
do

    printf "\n \033[1;35m Welcome to autoG !\n \033[0m"
    # read COUNTRY
    # case $COUNTRY in

    #     1)
            sh ./auto/safe.sh
    #     ;;

    #     2)
            # sh ./fast.sh
    #     ;;

    #     *)
    #         echo -n "unknown"
    #     ;;
    # esac

done