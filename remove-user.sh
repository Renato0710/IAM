#! /bin/bash

remove () {
  if [ ${1: -4} == ".csv" -o ${1: -4} == ".CSV" ]
    then
      csv=$1
      [ ! -f $csv ] && { echo "Error, no se encontró el archivo $csv"; exit 2; }
      i=0
      while read email
      do
        i=$((i+1))
        if [ $i -ne 1 ]
        then
          #Se ejecuta el comando para cada email
          sh remove-access-group.sh $email
          sh remove-sl-permissions.sh $email
        fi
      done < $csv
      exit 0

  else
    email=$1
    sh remove-access-group.sh $email
    sh remove-sl-permissions.sh $email
    exit 0
  fi
}

command="ibmcloud iam access-group-user-remove -f"
if [ "$#" -eq 1 ]
then
  remove $1

elif [ "$#" -eq 2 ]
then
  currentaccount=$(sh get-account.sh)
  account=$1
  if [[ $currentaccount != $account ]]
  then
    sh change-account.sh "$account"
  fi
  remove $2
  exit 0

else
  echo "Error, debe indicar el usuario a remover"
  exit 1
fi
