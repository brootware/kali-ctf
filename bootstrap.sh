#!/bin/bash

git clone https://github.com/brootware/kali-ctf.git && cd kali-ctf
sudo apt install python3-venv
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6



