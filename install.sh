#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ] ; then
    echo "This script must be executed with root privileges."
    exit 1
fi

apt -qqq -y install ansible

USER="ansible"
GROUP="ansible"

if ! [ `sed -n "/^$USER/p" /etc/passwd` ];then
    adduser $USER --disabled-password --gecos ""
fi

if ! id -nG "$USER" | grep -qw "$GROUP"; then
    adduser $USER sudo
fi

vault_password_file=$(awk -F "=" '/^vault_password_file/ {gsub(/[ \t]/, "", $2); print $2}' ansible.cfg)

if [ ! -f "$vault_password_file" ]; then
    echo "Local vault password file does not exist"
    echo "Please type vault password and I will create it for you"

    stty -echo
    printf "Password: "
    read VAULT_PASSWORD
    stty echo
    printf "\n"

    mkdir -p $(dirname ${vault_password_file})
    echo $VAULT_PASSWORD > $vault_password_file
    chown $USER:$GROUP $vault_password_file
fi

sudo -H -u $USER bash -c 'ansible-playbook installer/controller.yml -i installer/inventory'
