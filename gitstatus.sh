#!/bin/bash
pin1=0
pin2=0
pin3=0
pin4=0
pin5=0
pin6=0
GRN='\033[1;32m'
LG='\033[3;32m'
LR='\033[3;31m'
NC='\033[0m'
res=$(git status)
myarr=($res)
#echo -n $res

for (( i=0; i<=${#myarr[@]}; i++ ))
do
    if [[ ${myarr[$i]} == "unstage)" ]] #get index of before of "to be committed or added"
    then
        #echo ${myarr[$i]}
        pin1=$i
    fi
    if [[ ${myarr[$i]} == "commit:" ]] #get index of after all files
    then
        #echo ${myarr[$i]}
        pin2=$i
    fi
    if [[ ${myarr[$i]} == "directory)" ]] #get index of before of modifide files
    then
        #echo ${myarr[$i]}
        pin3=$i
    fi
    if [[ ${myarr[$i]} == "Untracked" ]] #get index of after all files
    then
        #echo ${myarr[$i]}
        pin4=$i
    fi
    if [[ ${myarr[$i]} == "no" ]] #get index of after all files
    then
        #echo ${myarr[$i]}
        pin6=$i
    fi
done
printf "${GRN}TO BE ADDED:${NC}\n"
printf "${LR}"
if [[ "$pin3" -eq 0 && "$pin2" -eq 0 && "$pin4" -gt 0 ]]
then

    pin3=$(($pin4 + 12))
    pin2=$pin4
    pin4=$((999))
elif [[ "$pin1" -gt 0 && "$pin3" -eq 0 && "$pin2" -eq 0 && "$pin4" -eq 0  ]]
then

    pin2=$((999))

fi
for (( i=0; i<=${#myarr[@]}; i++ ))
do

    if [[ "$i" -gt "$pin3" && "$i" -lt "$pin4" ]] #get index of after all files
    then

        if [[ ${myarr[$i]} != "modified:" && ${myarr[$i]} != "new" && ${myarr[$i]} != "file:" ]]
        then

            echo ${myarr[$i]}

        fi

    fi

    if [[ "$pin3" -gt 0 && "$pin2" -gt 0 && "$pin4" -eq 0 ]] # echo added and modified
    then

        if [[ "$i" -gt "$pin3" ]]
        then
            if [[ ${myarr[$i]} != "modified:" && ${myarr[$i]} != "new" && ${myarr[$i]} != "file:" ]]
            then

                echo ${myarr[$i]}
            fi
        fi

    fi

    if [[ "$pin1" -gt 0 && "$pin2" -gt 0 && "$pin3" -gt 0 && "$pin4" -gt 0 ]] # echo untracked
    then

        if [[ "$i" -gt $(($pin4 + 12)) ]]
        then

            echo ${myarr[$i]}
        fi

    fi
    if [[ "$pin1" -eq 0 && "$pin2" -gt 0 && "$pin3" -gt 0 && "$pin4" -gt 0 ]] # echo untracked "no"
    then

        if [[ "$i" -gt $(($pin4 + 12)) && "$i" -lt "$pin6" ]]
        then

            echo ${myarr[$i]}
        fi

    fi

done
if [[ "$pin4" -lt 999 && "$pin4" -gt 0 || "$pin3" -gt 0 && "$pin2" -gt 0 && "$pin4" -eq 0 ]]
then

    pin2=$(($pin2 - 4))
fi
printf "${NC}"
printf "${GRN}ADDED:${NC}\n"
printf "${LG}"
for (( i=0; i<=${#myarr[@]}; i++ ))
do
    if [[ "$pin1" -gt 0 ]]
    then

        if [[ "$i" -gt "$pin1" && "$i" -lt "$pin2" ]] #get index of after all files
        then

            if [[ ${myarr[$i]} != "modified:" && ${myarr[$i]} != "new" && ${myarr[$i]} != "file:" ]]
            then

                echo ${myarr[$i]}
            fi

        fi
    fi

done
printf "${NC}"