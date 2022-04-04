#!/bin/bash
clear
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
var101=0
while :;
do
    printf "\n${LP}MODE:[z/x]${NC}"
    read -n1 -r opt1
while :;
do
if [[ $opt1 = x ||$opt1 = X ]]
then
    clear
    disp="\n ${LP}To Commit: \"${NC}${YELLOW}Q${NC}${LP}\", To Pull-check: \"${NC}${YELLOW}P${NC}${LP}\", To Run: \"${NC}${YELLOW}R${NC}${LP}\" ${NC}${LP}, To Deploy: \"${NC}${YELLOW}D${NC}${LP}\"${NC}${LP}, Change Mode: \"${NC}${YELLOW}B${NC}${LP}\" ${NC}"
elif [[ $opt1 = z ||$opt1 = Z ]]
then
    if [[ $var101 = 0 ]]
    then
        clear
    fi
    var101=$(($var101+1))
    disp="\n ${LP}To Commit: \"${NC}${YELLOW}Q${NC}${LP}\", To Pull-check: \"${NC}${YELLOW}P${NC}${LP}\", To Run: \"${NC}${YELLOW}R${NC}${LP}\" ${NC}${LP}, To Deploy: \"${NC}${YELLOW}D${NC}${LP}\" ${NC}${LP}, To Clear: \"${NC}${YELLOW}C${NC}${LP}\" ${NC}${LP}, Change Mode: \"${NC}${YELLOW}B${NC}${LP}\" ${NC}"
else
    echo ""
    echo "invalid input"
    sleep 2
    break
fi
if [[ $opt1 = z || $opt1 = x || $opt1 = Z || $opt1 = X ]]
then
    printf "\n $disp"
    read -n1 -r choiceo
if [[ $choiceo = q || $choiceo = Q ]]
then
    echo ""
    git add .
    git restore --staged aa.sh
    git status
    echo -e "\n${GRN}PLEASE CHECK THE TO BE COMMITTED FILE/S CAREFULLY!${NC}"
    printf "\nWould you like to proceed? ${YELLOW}Y/N${NC} "; read -n1 -r anso;
        if [[ $anso = y || $anso = Y ]]
        then
            printf "\n${LCYAN}Write the commit message:${NC} "; read -r commito;
            printf "\n${LCYAN}Really? You want to commit?:${NC} "
             read -n1 -r haha

                  if [[ $haha = j || $haha = J ]]
                  then
                    echo -e "hahahahha"
                    $opt1 = x
                  break

              fi
            git commit -m "$commito"
            echo -e "\n${LP}Please wait, \npulling. . .${NC}"
            git pull origin dev
            echo -e "\n${LP}pushing. . .${NC}"
            git push origin john-dev
            sleep 3
        elif [[ $anso = n || $anso = N ]]
        then
            echo -e ""
        fi

elif [[ $choiceo = p || $choiceo = P ]]
then
    echo " "
    echo "$(git status)"
    echo -e "\n${LP}Please wait, \npulling. . .${NC}"
    git pull origin dev
    sleep 3
    echo -e "\n${LP}Please wait, \npushing. . .${NC}"
    git push origin john-dev
    sleep 2


elif [[ $choiceo = r || $choiceo = R ]]
then
    sh ./bb.sh
elif [[ $choiceo = d || $choiceo = D ]]
then
    var2=$(tasklist //FI "ImageName eq putty.exe")
    if [[ $var2 != "INFO: No tasks are running which match the specified criteria." ]]
    then
        echo -e "\n\n${LP}Terminating Old Putty.exe. . .${NC}"
        sleep 1
        taskkill //F //FI "ImageName eq putty.exe"
        taskkill //F //FI "ImageName eq notepad.exe"
    fi
    echo -e "\n${GRN}Launching \nPutty.exe. . .\nDeploy guide. . .${NC}"
    echo -e "Done"
    start "" "D:\noy\downs\putty.exe"
    start "" "C:\Users\sanch\Documents\dep.lnk"
    read dan
    if [[ $dan = "done" ]]
    then
        echo -e "\n\n${LP}Terminating Old Putty.exe. . .${NC}"
        sleep 1
        taskkill //F //FI "ImageName eq putty.exe"
        taskkill //F //FI "ImageName eq notepad.exe"
    fi

elif [[ $choiceo = c || $choiceo = C ]]
then
    clear
elif [[ $choiceo = b || $choiceo = B ]]
then
    break
elif [[ $choiceo = s || $choiceo = S ]]
then
    echo ""
    echo "opening sublime text. . ."
    var3=$(tasklist //FI "ImageName eq sublime_text.exe")
    if [[ $var3 != "INFO: No tasks are running which match the specified criteria." ]]
    then
        echo -e "\n\n${LP}Terminating Old sublime.exe. . .${NC}"
        sleep 1
        taskkill //F //FI "ImageName eq sublime_text.exe"
    fi
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\sublime text"
sleep 1
elif [[ $choiceo = a || $choiceo = A ]]
then
    echo ""
    git status
elif [[ $choiceo = i || $choiceo = I ]]
then
    varIns=$(tasklist //FI "ImageName eq insomnia.exe")
    if [[ $varIns != "INFO: No tasks are running which match the specified criteria." ]]
    then
        echo -e "\n\n${LP}Terminating Old insomnia.exe. . .${NC}"
        sleep 1
        taskkill //F //FI "ImageName eq insomnia.exe"
    fi
start "" "C:\Users\sanch\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Kong\insomnia.lnk"
elif [[ $choiceo = g || $choiceo = G ]]
then
taskkill //F //FI "ImageName eq sublime_text.exe"
taskkill //F //FI "ImageName eq node.exe"
taskkill //F //FI "ImageName eq cmd.exe"
taskkill //F //FI "ImageName eq notepad.exe"
taskkill //F //FI "ImageName eq putty.exe"
taskkill //F //FI "ImageName eq insomnia.exe"
taskkill //F //FI "ImageName eq skype.exe"
taskkill //F //FI "ImageName eq sqlyog.exe"
taskkill //F //FI "ImageName eq code.exe"
taskkill //F //FI "ImageName eq msedge.exe"
taskkill //F //FI "ImageName eq snippingtool.exe"
taskkill //F //FI "ImageName eq bash.exe"
fi
if [[ $opt1 = x ]]
then
    if [[ $choiceo = q || $choiceo = p || $choiceo = r || $choiceo = d || $choiceo = a || $choiceo = i || $choiceo = s ]]
    then
        echo -e "\n~~~~~~~~~~~~~Clearing after 5sec~~~~~~~~~~~~~~~~~~~"
        sleep 5
    fi
fi

fi
done
clear
done