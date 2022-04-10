#!/bin/bash

while :
do

printf "\n Enter q c s x --fast: "
read -n1 -r COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in

  q | Q)
    echo -n "Lithuanian"
    ;;

  c | C)
    echo -n "Romanian"
    ;;

  s | S)
    git status
    ;;

  *)
    echo -n "unknown"
    ;;
esac

done