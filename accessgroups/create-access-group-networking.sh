#! /bin/bash

#Creating Networking Access Group
ibmcloud config --locale en_US
accessgroup="Test-Networking"
ibmcloud iam access-group-create $accessgroup
ibmcloud iam access-group-policy-create $accessgroup --roles Administrator --attributes "serviceName=support"
