#! /bin/bash

#Creating Backups Access-Group
ibmcloud config --locale en_US
accessgroup="Test-Backups"
ibmcloud iam access-group-create $accessgroup
ibmcloud iam access-group-policy-create $accessgroup --roles Administrator --attributes "serviceName=support"
ibmcloud iam access-group-policy-create $accessgroup --service-name cloud-object-storage --roles "Operator","Object Reader","Content Reader","Writer" 
