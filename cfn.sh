#!/bin/bash

echo $1 $2 cfn

if [ $1 != "create" ] && [ $1 != "update" ]; then
  echo "Must be create or update"
  exit 1;
fi

if [ ! -f templates/$2.yml ]; then
  echo YML file for $2 does not exist;
  exit 1;
fi

if [ -f parameters/$2.json ]; then
  aws cloudformation $1-stack --stack-name $2 --template-body file:///home/dev/develop/cloudformation/templates/$2.yml --parameters file:///home/dev/develop/cloudformation/parameters/$2.json
else
  aws cloudformation $1-stack --stack-name $2 --template-body file:///home/dev/develop/cloudformation/templates/$2.yml
fi

