#!bin/bash
sudo iptables -A FORWARD -i cni0 -j ACCEPT
sudo iptables -A FORWARD -o cni0 -j ACCEPT
sudo su -
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list'
sudo apt-get update -y
sudo apt-get install -y kubeadm
sudo apt-get install -y oracle-java8-jdk
logout
curl -sS https://get.pimoroni.com/blinkt | bash
printf 'allow-hotplug eth0\n #iface eth0 inet dhcp\niface eth0 inet static\n address 192.168.1.42\n netmask 255.255.255.0\n gateway 192.168.1.1
domain_name_servers=8.8.8.8, 8.8.4.4' > eth0
sudo cp ./eth0 /etc/network/interfaces.d/eth0
sudo ifdown eth0
sudo ifup eth0
sudo rm ./eth0
