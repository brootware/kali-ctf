# kali-up
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
FORENSICS_PATH = "gusztavvargadr/ubuntu-desktop-2004-lts-xfce"

# VM_UPDATE: set to true to check for base VM updates
VM_UPDATE = true

# ATTACK_VM: can be changed here
ATTACK_VM = "attackerkali"
FORENSICS_VM = "forensicslab"


# VM_CPUS: specify the number of CPU cores to allocate to the VM
VM_CPUS = "4"
# VM_CPUS = "2"

# VM_MEMORY: specify the amount of memory to allocate to the VM
#VM_MEMORY = "8192"
VM_MEMORY = "4096"
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
        ansible.playbook = "site.yml"
    end
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box = FORENSICS_PATH
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
    config.vm.provision "shell", inline: <<-SHELL
	# download and configure sift installer
    cd /tmp
    curl -Lo /tmp/sift-cli-linux https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux
    curl -Lo /tmp/sift-cli-linux.sha256.asc https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux.sha256.asc
    gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys 22598A94
    gpg --verify sift-cli-linux.sha256.asc
    shasum -a 256 -c sift-cli-linux.sha256.asc
    mv /tmp/sift-cli-linux /usr/local/bin/sift
    chmod 755 /usr/local/bin/sift
	# run sift installer
    /usr/local/bin/sift install --mode=packages-only
    SHELL
end
