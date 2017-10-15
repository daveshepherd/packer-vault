#! /bin/bash

set -e


until sudo apt-get -y install zip
do
  echo "Try again"
  sleep 5
done

curl -o /tmp/vault.zip https://releases.hashicorp.com/vault/0.8.3/vault_0.8.3_linux_amd64.zip

unzip -d /tmp /tmp/vault.zip

sudo mv /tmp/vault /usr/local/bin/vault

sudo useradd vault -m -s /usr/sbin/nologin -d /var/vault

sudo mkdir -p /etc/vault.d

sudo mv /tmp/vault.json /etc/vault.d/vault.json

sudo setcap cap_ipc_lock=+ep $(readlink -f $(which vault))

sudo mv /tmp/systemd.service /etc/systemd/system/vault.service

sudo chown root:root /etc/systemd/system/vault.service

sudo systemctl enable vault