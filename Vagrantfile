# kali-ctf
# Credit - This vagrantfile is developed by referring to https://github.com/stevemcilwain/Disposable-Kali/blob/master/Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

############################################################
# VM settings variables - Can be reviewed and customized
############################################################

# VAGRANTFILE_API_VERSION: to choose which API to use. Recommended to use 2.
VAGRANTFILE_API_VERSION = "2"

# VARIABLES for virtualbox and vmware as provider
VIRTUALBOX = "virtualbox"

# VM_PATH:  the name or full url of the base VM to use
ATTACKER_PATH = "kalilinux/rolling"

# VM_UPDATE: set to true to check for base VM updates
VM_UPDATE = true

# ATTACK_VM: can be changed here
ATTACK_VM = "attackerkali"


# VM_CPUS: specify the number of CPU cores to allocate to the VM
VM_CPUS = "4"
# VM_CPUS = "2"

# VM_MEMORY: specify the amount of memory to allocate to the VM
VM_MEMORY = "8192"
# VM_MEMORY = "4096"
#VM_MEMORY = "2048"

########################################################################################
# THE COMPONENTS BELOW SHOULD NOT BE ALTERED UNLESS YOU KNOW WHAT YOU'RE DOING
########################################################################################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = ATTACKER_PATH
    config.vm.network :private_network, type: "dhcp"
    config.vm.hostname = ATTACK_VM
    config.vm.box_check_update = VM_UPDATE
    config.ssh.insert_key = false

  
    # VIRUTALBOX SETTINGS
    config.vm.provider VIRTUALBOX do |vb|
        vb.name = ATTACK_VM
        vb.cpus = VM_CPUS
        vb.memory = VM_MEMORY
        vb.customize ["modifyvm", :id, "--vram", "256"]
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    end


    # Ansible provisioner.
    config.vm.provision :ansible do |ansible|
        ansible.playbook = "install.yml"
    end
end
