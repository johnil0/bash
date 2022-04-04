#!/bin/bash

while :
do

printf "\n Enter mode: "
read COUNTRY
case $COUNTRY in

  1)
    sh ./safe.sh
    ;;

  2)
    sh ./fast.sh
    ;;

  *)
    echo -n "unknown"
    ;;
esac

done