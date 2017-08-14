#!bin/bash
sudo iptables -A FORWARD -i cni0 -j ACCEPT
sudo iptables -A FORWARD -o cni0 -j ACCEPT
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > sudo /etc/apt/sources.list.d/kubernetes.list
sudo apt-get -y update 
sudo apt-get -y install kubeadm
sudo apt-get -y install oracle-java8-jdk
logout
curl -sS https://get.pimoroni.com/blinkt | bash
printf 'allow-hotplug eth0\n iface eth0 inet static\n address 192.168.1.42\n netmask 255.255.255.0\n gateway 192.168.1.1\n domain_name_servers=8.8.8.8, 8.8.4.4' > /temp/eth0
sudo cp ./eth0 /etc/network/interfaces.d/eth0
sudo ifdown eth0
sudo ifup eth0
sudo rm ./eth0
