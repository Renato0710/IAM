#! /bin/bash

#Creating all access-groups

sh create-access-group-backups.sh
sh create-access-group-iam.sh
sh create-access-group-networking.sh
sh create-access-group-platform.sh
sh create-access-group-pm.sh
sh create-access-group-cloud.sh
exit 0
