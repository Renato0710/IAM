#! /bin/bash

#Creating Networking Access Group
ibmcloud config --locale en_US
accessgroup="Test-Cloud"
ibmcloud iam access-group-create $accessgroup
ibmcloud iam access-group-policy-create $accessgroup --roles Administrator,Manager --attributes "serviceType=service"
ibmcloud iam access-group-policy-create $accessgroup --roles Administrator --attributes "serviceType=platform_service"
