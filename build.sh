#! /bin/bash

PACKER=$(which packer)
[[ -z ${PACKER} ]] &&  echo 'packer command not found in the search path. exiting...' && exit 1

VAULT_VERSION=0.9.5

${PACKER} build -var "london_vpc_id=${LONDON_VPC}" -var "london_subnet_id=${LONDON_SUBNET}" -var "ireland_vpc_id=${IRELAND_VPC}" -var "ireland_subnet_id=${IRELAND_SUBNET}" -var "vault_version=${VAULT_VERSION}" vault.json