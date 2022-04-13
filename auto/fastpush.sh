#!/bin/sh
LG='\033[3;32m'
LGY='\033[1;33m'
LR='\033[3;31m'
NC='\033[0m'

arr=($c)
tbadded=()
commes=()
namearray=(${namear[@]})
namearray1=(${namear1[@]})
if [[ ${#namear[@]} -gt 0 ]]
then
    echo "haha"
fi

for value in "${arr[@]}"
do
    echo "> $value"
    if [[ $value != "xxx" ]]
    then
        tbadded+=($value)
    else
        break
    fi
done

for value in "${namearray[@]}"
do
    echo ">> $value"
    if [[ $value -lt ${#tbadded[@]} ]]
    then

        # printf "\033[3;37m ${tbadded[$value]} ${NC} ${LG} was staged ${NC}\n"
        git add ${tbadded[$value]} &> /dev/null
    else
        printf "$value ${LR}not found${NC}\n"
    fi


done
for value in "${namearray1[@]}"
do

    if [[ $value != "push" ]]
    then
        commes+=($value)
    fi
done
if [[ ${#commes[@]} -gt 0 ]]
then
    echo "hahahha"
fi
git commit -m "${commes[*]}"
git push origin $MYBRANCH &> /dev/null