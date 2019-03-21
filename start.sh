#!/bin/bash
IP=$1
USER=$2

ssh -vvv -o StrictHostKeyChecking=no -l root $IP "git clone https://github.com/rancher/install-docker.git &&
cd install-docker &&
chmod +x 17.03.sh &&
./17.03.sh &&
sudo usermod -aG docker $USER &&
sudo iptables -A INPUT -p tcp --dport 6443 -j ACCEPT"
rke up
