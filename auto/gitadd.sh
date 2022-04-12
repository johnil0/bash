#!/bin/sh
LG='\033[3;32m'
LGY='\033[1;33m'
LR='\033[3;31m'
NC='\033[0m'
arr=($c)
tbadded=()

namearray=(${namear[@]})
printf "${LGY}Add: "
# read -r opt
printf "${NC}"
# optarr=($opt)


for value in "${arr[@]}"
do

    if [[ $value != "xxx" ]]
    then
        tbadded+=($value)
    else
    break
    fi
done

for value in "${namearray[@]}"
do

    if [[ $value -lt ${#tbadded[@]} ]]
    then

        printf "\033[3;37m ${tbadded[$value]} ${NC} ${LG} was staged ${NC}\n"
        addd=$(git add ${tbadded[$value]} &> /dev/null)
    else
        printf "$value ${LR}not found${NC}\n"
    fi


done