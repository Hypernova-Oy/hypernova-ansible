# hypernova-ansible

## Requirements
 In order to access inventory, you have to add your SSH key into
Hypernova's inventory repository hosted at our GitLab server:

`https://git.hypernova.fi/hypernova/hypernova-ansible-inventory/settings/repository#js-deploy-keys-settings`

## Install controller locally
* Clone this repository

  ```
  git clone https://github.com/Hypernova-Oy/hypernova-ansible.git
  cd hypernova-ansible
  ```

* Execute installation script with root privileges

  ```
  sudo ./install.sh
  ```

The installation script installs Ansible from Debian packages, creates an user
`ansible` (and adds it to sudo group) and clones all required repositories and
submodules.
