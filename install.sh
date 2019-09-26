#!/bin/sh

set -e

if [ "$(id -u)" -ne 0 ] ; then
    echo "This script must be executed with root privileges."
    exit 1
fi

apt -qqq -y install ansible

USER="ansible"
GROUP="sudo"

if ! [ `sed -n "/^$USER/p" /etc/passwd` ];then
    adduser $USER --disabled-password --gecos ""
fi

if ! id -nG "$USER" | grep -qw "$GROUP"; then
    adduser $USER $GROUP
fi

sudo -H -u $USER bash -c 'ansible-playbook installer/controller.yml -i installer/inventory'
