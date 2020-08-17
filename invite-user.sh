#! /bin/bash

invite () {
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
          $command $email
        fi
      done < $csv
      exit 0

  else
    email=$1
    $command $email
    exit 0
  fi
}

command="ibmcloud account user-invite"
if [ "$#" -eq 1 ]
then
arg1=$1
invite $arg1
  
elif [ "$#" -eq 2 ]
then
  currentaccount=$(sh get-account.sh)
  account=$1  
  if [[ $currentaccount != $account ]]
  then
    sh change-account.sh "$account"
  fi
  invite $2
  exit 0

else
  echo "Error, debe indicar el correo del usuario a invitar"
  exit 1
fi

