# [Laboratoire 8](<../../labs pdf/Laboratoire-8.txt>)
# Déployer un domaine Active Directory avec Vagrant et Ansible

## Prérequis

### Installer Vmware workstation :
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y build-essential p7zip-full
sudo apt install gcc-12 libgcc-12-dev -y
sudo apt install libaio1
wget https://softwareupdate.vmware.com/cds/vmw-desktop/ws/17.5.2/23775571/linux/core/VMware-Workstation-17.5.2-23775571.x86_64.bundle.tar
7z x VMware-Workstation-17.5.2-23775571.x86_64.bundle.tar
chmod +x VMware-Workstation-17.5.2-23775571.x86_64.bundle
```
#### Installation
```bash
./VMware-Workstation-17.5.2-23775571.x86_64.bundle
wget https://github.com/mkubecek/vmware-host-modules/archive/workstation-17.5.1.tar.gz
tar -xzf workstation-17.5.1.tar.gz && cd vmware-host-modules-workstation-17.5.1
tar -cf vmmon.tar vmmon-only && tar -cf vmnet.tar vmnet-only
sudo cp -v vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/
sudo vmware-modconfig --console --install-all
```
#### go finish vmware setup
```bash
vmware workstation
```
### Installer Vagrant

#### ajouter le repo et install les prerequis
```bash
sudo apt update
sudo apt install curl -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt update
```
#### Installation

```bash
sudo apt install vagrant -y
vagrant --version
```
#### installer support pour vmware workstation 
[vagrant utility](https://developer.hashicorp.com/vagrant/install/vmware)

```bash
sudo apt install ./vagrant-vmware-utility_1.0.20_x86_64.deb
vagrant plugin install vagrant-vmware-desktop
```

### Installer ansible et python/pip
```bash
sudo apt update && sudo apt install ansible python3-pip
```
#### installer pywinrm
```bash
python3 -m pip install pywinrm
```
#### installer les plugins vragrant pour windows
```bash
vagrant plugin install winrm 
vagrant plugin install winrm-elevated 
vagrant plugin install winrm-fs
```
#### installer plugin pour windows ansible
```bash
ansible-galaxy collection install community.windows 
ansible-galaxy collection install ansible.windows
```
### Ficher VagrantFile
```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "gusztavvargadr/windows-server"
  config.vm.provider "vmware_desktop" do |vmware|
    vmware.cpus = "2"
    vmware.memory = "2048"
    vmware.linked_clone = false
#    vmware.clone_type = "full"
    vmware.gui = true
  end

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook-ansible.yml"
  end
end
```


### Ficher Ansible pour installer AD
```yaml
- name: Configure role(s) on a Windows server instance
  hosts: all
  vars:
    ansible_connection: winrm
    ansible_winrm_transport: ntlm
    ansible_winrm_scheme: http
    ansible_port: 55985
    ansible_winrm_server_cert_validation: ignore
    ansible_user: Vagrant
    ansible_password: vagrant
  tasks:

  - name: Install AD-Domain-Services feature
    ansible.windows.win_feature:
      name: AD-Domain-Services
      include_management_tools: true
      include_sub_features: true
  - name: Change the hostname
    ansible.windows.win_hostname:
      name: dc
    register: hostname
  - name: Reboot the machine if needed
    win_reboot:
     reboot_timeout: 600
     test_command: echo 'Rebooted'
     pre_reboot_delay: 5
     post_reboot_delay: 5
    register: reboot_status

  - name: Ensure the machine is back online
    wait_for_connection:
     delay: 10
     timeout: 300
    when: reboot_status.changed
  - name: Setup Active Directory Controller
    ansible.windows.win_domain:
      dns_domain_name: "killer.net"
      safe_mode_password: "Crosemont01!"
    register: active_directory_controllers
  - name: Reboot the machine if needed
    win_reboot:
     reboot_timeout: 600
     test_command: echo 'Rebooted'
     pre_reboot_delay: 5
     post_reboot_delay: 5
    register: reboot_status

  - name: Ensure the machine is back online
    wait_for_connection:
     delay: 10
     timeout: 300
    when: reboot_status.changed
```
