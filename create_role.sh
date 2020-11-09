#!/usr/bin/env bash

roles_name=$1
findroles=$(find . -depth 1 -name roles)

if [ -d $findroles/$roles_name ]; then
  echo "role with the name $roles_name exists"
  echo "script will be teminated"
  exit 1
else
  echo "role name is unique"
  echo "creating new role and required subdirectories "
  mkdir -p  $findroles/$roles_name/{tasks,handlers,templates,files,vars,defaults,meta}

  echo "create default main.yml files"
  touch $findroles/$roles_name/{tasks,handlers,vars,defaults,meta}/main.yaml

  for i in $(find $findroles/$roles_name -type f ); do
      echo "---" >> $i
  done
fi