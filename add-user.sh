#! /bin/bash

check() {
  email=$1
  user=$(ibmcloud account users | grep -i $email)
  if [ -z "$user" ]
  then
    sh invite-user.sh $email
  fi
}

add () {
  if [ ${2: -4} == ".csv" -o ${2: -4} == ".CSV" ]
    then
      accessgroup=$1
      csv=$2
      [ ! -f $csv ] && { echo "Error, no se encontró el archivo $csv"; exit 2; }
      i=0
      while read email
      do
        i=$((i+1))
        if [ $i -ne 1 ]
        then
          #Se ejecuta el comando para cada email
	  check $email
          $command $accessgroup $email
	  sh give-sl-permissions.sh $accessgroup $email
        fi
      done < $csv
      exit 0

  else
    accessgroup=$1
    email=$2
    check $email
    $command $accessgroup $email
    echo $accessgroup $email
    sh give-sl-permissions.sh $accessgroup $email
    exit 0
  fi
}

command="ibmcloud iam access-group-user-add"
if [ "$#" -eq 2 ]
then
  add $1 $2

elif [ "$#" -eq 3 ]
then
  currentaccount=$(sh get-account.sh)
  account=$1
  if [[ $currentaccount != $account ]]
  then
    sh change-account.sh "$account"
  fi
  add $2 $3
  exit 0

else
  echo "Error, debe indicar el grupo de acceso y el usuario a agregar"
  exit 1
fi
