# Fast-lab

Fast-lab automates downloading and installation of additional tools, frameworks and packages in a Kali virtual machine. The tool installs both offensive (Red) and defensive/forensics (Blue) tools for Capture The Flag (CTF) competitions.

## What's included

Blue team tools

```yaml
packages:
  - foremost
  - sleuthkit
  - autopsy
  - fcrackzip
  - gdb
  - exiftool
  - radare2
  - rz-ghidra
  - kali-tools-crypto-stego
  - volatility3
  - olevba
  - oledump
```

Red team tools

```yaml
packages:
  - tobeadded
```

## Pre-requisites

- (Virtualbox)[https://www.virtualbox.org/wiki/Downloads]
- (Vagrant)[https://www.vagrantup.com/downloads]
- Recommended to have at least 16GB RAM on your PC, MAC or Linux.

## How to use

```bash
sudo apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6
vagrant up
```

### If the vm is already provisioned and you just want to run the playbooks

```bash
vagrant provision
```
