#! /bin/bash

account=$(ibmcloud account show | awk -F': ' '/Account Name: /{print $2}')
echo $account
