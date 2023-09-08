choco install vagrant
choco install python3 --pre 
python3 -m venv .venv
.\venv\bin\Activate.ps1
python3 -m pip install --upgrade pip
python3 -m pip install ansible-core==2.12.6
vagrant up