#!/bin/bash

# ubuntu image

# Make ubuntu admin
sudo usermod -aG sudo ubuntu

RUN_SCRIPT="java -Xmx3700M -Xms3700M -jar server.jar nogui"

apt-get update -y

apt install openjdk-16-jre -y

cd /home/ubuntu
mkdir minecraft
cd /minecraft

# 1.17.1
wget https://launcher.mojang.com/v1/objects/a16d67e5807f57fc4e550299cf20226194497dc2/server.jar
touch run.sh
chmod +x run.sh
echo "${RUN_SCRIPT}" > run.sh

./run.sh
echo "eula=true" > eula.txt

# The rest is manual
# please run it in tmux so you can move around the server and access the session
# please tune in your server settings and add world if you need one
# tmux new-session -d -s minecraft "./run.sh"