#! /bin/bash

declare -a groups=("Test-Backups" "Test-Cloud" "Test-Networking" "Test-IAM" "Test-Platform" "Test-PM")

if [ "$#" -eq 1 ]
then
  email=$1
  for group in "${groups[@]}"
  do
    user=$(ibmcloud iam access-group-users $group | grep -i $email)
    if [ ! -z "$user" ]
    then
      ibmcloud iam access-group-user-remove -f $group $user  
    fi
  done
else
  echo "Error, debe indicar el correo del usuario"
  exit 1
fi
