#!/bin/sh
source ./auto/srcvar.sh

LG='\033[3;32m'
LGY='\033[1;33m'
LR='\033[3;31m'
NC='\033[0m'

arr=($c)
tbadded=()
commes=()
namearray=(${namear[@]}) # index array
namearray1=(${namear1[@]}) # message array



for value1 in "${arr[@]}"
do

    if [[ $value1 != "xxx" ]]
    then
        tbadded+=($value1)
    else
        break
    fi
done

for value2 in "${namearray[@]}"
do

    if [[ $value2 -le ${#tbadded[@]} ]]
    then


        printf "\033[3;37m ${tbadded[$value]} ${NC} ${LG} was staged ${NC}\n"
        git add ${tbadded[$value]} &> /dev/null
    else
        printf "$value2 ${LR}not found${NC}\n"
    fi


done
for value3 in "${namearray1[@]}"
do

    if [[ $value3 != "push" ]]
    then
        commes+=($value3)
    fi
done

if [[ ${#namearray[@]} -eq 0 && ${#commes[@]} -eq 0 ]]
then
    git add . &> /dev/null
    printf "\033[1;32m Everything was STAGED. \033[0m \n"
    printf "\033[1;36mPUSHED \033[0m"
    git commit -m "$MESSAGE"
    git push origin $MYBRANCH &> /dev/null
fi
if [[ ${#namearray[@]} -eq 0 && ${#commes[@]} -gt 0 ]]
then
    git add . &> /dev/null
    printf "\033[1;32m Everything was STAGED. \033[0m \n"
    printf "\033[1;36mPUSHED \033[0m"
    git commit -m "${commes[*]}"
    git push origin $MYBRANCH &> /dev/null
fi
if [[ ${#namearray[@]} -gt 0 && ${#commes[@]} -gt 0 ]]
then
    printf "\033[1;36mPUSHED \033[0m"
    git commit -m "${commes[*]}"
    git push origin $MYBRANCH &> /dev/null
fi
if [[ ${#namearray[@]} -gt 0 && ${#commes[@]} -eq 0 ]]
then
    printf "\033[1;36mPUSHED \033[0m"
    git commit -m "$MESSAGE"
    git push origin $MYBRANCH &> /dev/null
fi
