#! /bin/bash

#Creating Networking Access Group
ibmcloud config --locale en_US
accessgroup="Test-PM"
ibmcloud iam access-group-create $accessgroup
