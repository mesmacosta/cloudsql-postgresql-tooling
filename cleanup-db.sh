#!/usr/bin/env bash
root_dir=$(pwd)
cd infrastructure/terraform

public_ip_address=$(cat terraform.tfstate | jq '.outputs.public_ip_address.value')
username=$(cat terraform.tfstate | jq '.outputs.username.value')
password=$(cat terraform.tfstate | jq '.outputs.password.value')
database=$(cat terraform.tfstate | jq '.outputs.db_name.value')

# Remove quotes
public_ip_address=${public_ip_address//\"/}
username=${username//\"/}
password=${password//\"/}
database=${database//\"/}

docker run --rm --tty -v \
"$PWD":/data #ADD DOCKER IMAGE:stable \
--postgresql-host $public_ip_address \
--postgresql-user $username \
--postgresql-pass $password \
--postgresql-database $database

cd $root_dir