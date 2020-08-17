#! /bin/bash

if [ "$#" -eq 2 ]
then
  sh remove-user.sh $2
  sh add-user.sh $1 $2

elif [ "$#" -eq 3 ]
then
  currentaccount=$(sh get-account.sh)
  account=$1
  if [[ $currentaccount != $account ]]
  then
    sh change-account.sh "$account"
  fi
  sh remove-user.sh $3
  sh add-user.sh $2 $3
  exit 0

else
  echo "Error, debe indicar el grupo de acceso y el usuario a mover"
  exit 1
fi
