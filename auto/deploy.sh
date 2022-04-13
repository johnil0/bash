    source ./auto/srcvar.sh
    var2=$(tasklist //FI "ImageName eq putty.exe")
    if [[ $var2 != "INFO: No tasks are running which match the specified criteria." ]]
    then
        echo -e "\n\n${LP}Terminating Old Putty.exe. . .${NC}"
        sleep 1
        taskkill //F //FI "ImageName eq putty.exe"
        taskkill //F //FI "ImageName eq notepad.exe"
    fi
    echo -e "\n${GRN}Launching \nPutty.exe. . .\nDeploy guide. . .${NC}"
    start "" $PUTTY
    start "" $TXT
    read dan
        if [[ $dan = "done" ]]
    then
        echo -e "\n\n${LP}Terminating Old Putty.exe. . .${NC}"
        sleep 1
        taskkill //F //FI "ImageName eq putty.exe"
        taskkill //F //FI "ImageName eq notepad.exe"
    fi