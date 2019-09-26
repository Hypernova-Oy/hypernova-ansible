# hypernova-ansible

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

## Usage
### Production usage

#### Required repository access

* git@git.hypernova.fi:hypernova/hypernova-ansible-playbook.git
* git@git.hypernova.fi:hypernova/hypernova-ansible-inventory.git

### Development usage
For development and testing purposes you may replace production repositories
via the following variables

```
controller_repo: "https://github.com/Hypernova-Oy/hypernova-ansible.git"
controller_inventory_repo: "git@git.hypernova.fi:hypernova/hypernova-ansible-inventory.git"
controller_playbook_repo: "git@git.hypernova.fi:hypernova/hypernova-ansible-playbook.git"
```
