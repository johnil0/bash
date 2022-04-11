#!/bin/sh
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
git pull origin john-dev
git commit -m "${mes[@]}"
git push origin john-dev
