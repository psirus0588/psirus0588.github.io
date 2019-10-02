#!/bin/bash 

# GCloud
#############################
# Argumentst
# $1 is command type
#
# create - Create $2[project], $3[manage] $4[zone] and A records with $5[ip] 
#
#############################
TTL=604800
#ttl 604800 for one week 

if [ $1 = "create" ]; then
  PROJECT=$2
  MANAGE_ZONE=$3
  DOMAIN=$4
  IP=$5
  
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

else
  echo "command not exist"
  exit 1
fi



exit 0
