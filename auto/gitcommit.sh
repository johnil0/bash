#!/bin/sh
source ./auto/srcvar.sh
LG='\033[3;32m'
LGY='\033[1;33m'
LR='\033[3;31m'
NC='\033[0m'

mes=()
arr=(${namear[@]})


for value in "${arr[@]}"
do

    if [[ $value != "q" ]]
    then
        mes+=($value)
    fi
done
mes1=${mes[*]}
git pull origin $BRANCH &> /dev/null
git add . &> /dev/null
printf "\033[0;32m"
if [[ ${mes[*]} == "" ]]
then
    git commit -m "$MESSAGE"
else
    git commit -m "${mes[*]}"
fi
printf "\033[0m"
sh ./auto/gitstatus.sh