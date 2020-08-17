#! /bin/bash

#Validamos que exista 1 argumento
if [ "$#" -ne 1 ]
then
  echo 'Error, debe indicar el correo del usuario'
  exit 1

else
  
  user=$1

  id=$(sh get-id.sh $user) 
  echo "Eliminando permisos"
  ibmcloud sl user permission-edit $id --permission ALL --enable "false"
  echo "Permisos eliminados"
fi

exit 0
