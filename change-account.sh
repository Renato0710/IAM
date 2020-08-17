#! /bin/bash

#Validamos que al menos exista 1 argumento
if [ "$#" -ne 1 ]
then
  echo 'Error, debe indicar la cuenta a la que quiere cambiar'
  exit 1

else
  mainaccount="Renato"
  currentaccount=$(sh get-account.sh)
  account=$1
  if [[ $currentaccount != $mainaccount ]]
  then
    sh login.sh apikey.json
  fi
  
  bucket="apikeys"
  file="tempkey.json"
  ibmcloud cos get-object --bucket $bucket --key "${account}.json" $file
  sh login.sh $file
  rm -f $file
  exit 0
fi
