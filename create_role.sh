#!/usr/bin/env bash

roles_name=$1
findroles=$(find . -depth 1 -name roles)

mkdir -p  $findroles/$roles_name/{tasks,handlers,templates,files,vars,defaults,meta}

touch $findroles/$roles_name/{tasks,handlers,vars,defaults,meta}/main.yml
