<div align="center">
  <h1> Kali-CTF 🖥️ </h1>
</div>

Kali-CTF automates downloading and installation of additional tools, frameworks and packages in a Kali virtual machine. The tool installs defensive/forensics (Blue team) tools in addition to Offensive (Red team) tools for Capture The Flag (CTF) competitions.

> Vagrant usage is only supported for **Mac(Intel)** and **Linux hosts** currently. For windows and Mac with apple silicon chips, run the playbook locally.

## What's included

Forensic tools

```yaml
packages:
  - foremost
  - sleuthkit
  - autopsy
  - fcrackzip
  - exiftool
  - kali-tools-crypto-stego
  - volatility3
  - olevba
  - oledump
  - verifyhash
```

Binary exploitation and Reverse Engineering tools

```yaml
packages:
  - gdb
  - radare2
  - rz-ghidra
  - ghidra
  - checksec
  - ropper
```

## Pre-requisites

- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](https://www.vagrantup.com/downloads)
- [chocolatey](https://chocolatey.org/install)
- [brew](https://brew.sh/)
- Recommended to have at least 16GB RAM on your PC, MAC or Linux.

## How to use

On Mac (Intel Chips)

```bash
brew install python3
python3 -m pip install pipx
python3 -m pipx ensurepath
python3 -m pipx install virtualenv
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6
vagrant up
```

On Linux

```bash
sudo apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6
vagrant up
```

On Windows

Install kali linux via wsl2 and follow this guide to install kex.
https://www.kali.org/docs/wsl/win-kex/

Run kex

```bash
kex --win -s
```

go into the newly spun up kali vm

```bash
git clone https://github.com/brootware/kali-ctf.git
sudo apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6
ansible-playbook install.yml
```

### Retries and errors

If the VM is already provisioned, try running below again to provision until the errors are gone.

```bash
vagrant provision
```

Once provisioning is done, run below to install pwn-dbg plugin for gdb debugger within kali session.

```bash
cd /opt/pwndbg/
./setup.sh
```

