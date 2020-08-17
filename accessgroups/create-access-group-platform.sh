#! /bin/bash

#Creating Networking Access Group
ibmcloud config --locale en_US
accessgroup="Test-Platform"
ibmcloud iam access-group-create $accessgroup
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=entitlement"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=iam-access-management"
ibmcloud iam access-group-policy-create $accessgroup --roles Administrator --attributes "serviceName=support"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=iam-groups"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator,Writer --attributes "serviceType=service"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=billing"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=iam-identity"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=globalcatalog"
ibmcloud iam access-group-policy-create $accessgroup --roles Editor --attributes "serviceName=user-management"
ibmcloud iam access-group-policy-create $accessgroup --roles Operator --attributes "serviceName=globalcatalog-collection"
