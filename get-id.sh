#! /bin/bash

#Validamos que exista 1 argumento (correo)
if [ "$#" -ne 1 ]
then
  echo 'Error, debe indicar el correo del usuario'
  exit 1

else
  email=$1
  id=$(ibmcloud sl user list | grep $email | awk '{print $1;}')
  echo $id
fi
