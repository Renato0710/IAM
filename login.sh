#! /bin/bash

echo 'Iniciando sesión en IBM Cloud...'

#Region de IBMCloud
region='us-south'

#Comando para loguearse a IBM Cloud
command="ibmcloud login -r ${region} --apikey"

#Validamos que existe el argumento "apikey", ya sea en formato string o file

#Si existe solo 1 argumento
if [ "$#" -eq 1 ]
then

  #Si el argumento es un archivo json
  if [ ${1: -5} == ".json" -o ${1: -5} == ".JSON" ]
  then
    apikey="@${1}"
  
  #Si el argumento es un string
  else
    apikey="$1"

  fi

  #Ejecutamos el comando con el apikey
  $command $apikey
  exit 0 

#Si no existe el argumento
else
  echo 'Error, debe indicar el apikey'
  exit 1
fi
