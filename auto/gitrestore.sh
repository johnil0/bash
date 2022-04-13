#!/bin/sh
LG='\033[3;32m'
LGY='\033[1;33m'
LR='\033[3;31m'
NC='\033[0m'
arr=($c)
added=()
cnt=()
namearray=(${namear[@]})
printf "${LGY}Unstage:\n"
# read -r opt
printf "${NC}"
# optarr=($opt)
a=${#namearray[@]}
b=1
cnt=$(( $a-$b))

for val in "${arr[@]}"
do
    if [[ $val == "xxx" ]]
    then
        cnt+=($val)
    else
        if [[ ${#cnt[@]} == 2 ]]
        then
            added+=($val)
        fi
    fi
done
echo ${#namearray[@]}
for value in "${namearray[@]}"
do
    if [[ $value -le ${#added[@]} ]]
    then

        printf "\033[3;37m ${added[$value]} ${NC} ${LG} was restored ${NC}\n"
        git restore --staged ${added[$value]}
    else
        printf "$value ${LR}not found${NC}\n"
    fi
done