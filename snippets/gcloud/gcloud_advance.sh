#!/bin/bash 

# GCloud
PROJECT=$1
MANAGE_ZONE=$2
DOMAIN=$3
IP=$4
TTL=604800
#ttl 604800 for one week 

#Create project
gcloud alpha projects create $PROJECT --name="$PROJECT"

#Create dns zone
gcloud beta dns --project=$PROJECT managed-zones create $MANAGE_ZONE --description= --dns-name=$DOMAIN.
#OUTPUT: Created [https://dns.googleapis.com/dns/v1beta2/projects/$PROJECT/managedZones/$MANAGE_ZONE].

# ADD RECORDS
gcloud dns --project=$PROJECT record-sets transaction start --zone=$MANAGE_ZONE
gcloud dns --project=$PROJECT record-sets transaction add $IP --name=\*.$DOMAIN. --ttl=$TTL --type=A --zone=$MANAGE_ZONE
gcloud dns --project=$PROJECT record-sets transaction add $IP --name=@.$DOMAIN. --ttl=$TTL --type=A --zone=$MANAGE_ZONE
gcloud dns --project=$PROJECT record-sets transaction execute --zone=$MANAGE_ZONE

exit 0
