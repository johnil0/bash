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

for value1 in "${arr[@]}"
do
    echo "> $value1"
    if [[ $value1 != "xxx" ]]
    then
        tbadded+=($value1)
    else
        break
    fi
done

for value2 in "${namearray[@]}"
do
    echo ">> $value2"
    echo ">>.. ${#tbadded[@]}"
    if [[ $value2 -le ${#tbadded[@]} ]]
    then

        # printf "\033[3;37m ${tbadded[$value]} ${NC} ${LG} was staged ${NC}\n"
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
if [[ ${#commes[@]} -gt 0 ]]
then
    echo "hahahha"
fi
git commit -m "${commes[*]}"
git push origin $MYBRANCH &> /dev/null