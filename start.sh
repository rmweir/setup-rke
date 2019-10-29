#!/bin/bash
IP=$1
USER=$2
KEYPATH=$3
ssh -i $KEYPATH -vvv -o StrictHostKeyChecking=no -l $USER $IP "git clone https://github.com/rancher/install-docker.git &&
cd install-docker &&
chmod +x 17.03.sh &&
./17.03.sh &&
sudo usermod -aG docker $USER &&
sudo iptables -A INPUT -p tcp --dport 6443 -j ACCEPT"
