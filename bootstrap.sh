#!/bin/bash
# Get the operating system name
os_name=$(uname -s)

# Check if the operating system is macOS
if [[ "$os_name" == "Darwin" ]]; then
    git clone https://github.com/brootware/kali-ctf.git && cd kali-ctf
    brew install python3
    python3 -m pip install pipx
    pipx ensurepath
    pipx install python3-venv
    python3 -m venv .venv
    source .venv/bin/activate
    python3 -m pip install --upgrade pip
    python3 -m pip install ansible-core==2.12.6
    vagrant up
# Check if the operating system is Linux
elif [[ "$os_name" == "Linux" ]]; then
    git clone https://github.com/brootware/kali-ctf.git && cd kali-ctf
    sudo apt install python3-venv
    python3 -m venv .venv
    source .venv/bin/activate
    python3 -m pip install --upgrade pip
    python3 -m pip install ansible-core==2.12.6
    vagrant up
else
    echo "Unknown operating system."
fi



