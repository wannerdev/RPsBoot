#!bin/bash
sudo iptables -A FORWARD -i cni0 -j ACCEPT
sudo iptables -A FORWARD -o cni0 -j ACCEPT
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo deb http://apt.kubernetes.io/ kubernetes-xenial main > ./kubernetes.list
sudo cp ./kubernetes.list /etc/apt/sources.list.d/kubernetes.list
sudo apt-get -y update 
sudo apt-get -y install kubeadm
sudo apt-get -y install oracle-java8-jdk
wget https://bitbucket.org/logicline/kubernetes-hacknight/downloads/blinkled-1.0-all.jar -P /home/pirate/blinkled
sudo wget https://bitbucket.org/logicline/kubernetes-hacknight/downloads/libjffi-1.2.so -P /usr/lib/
printf '#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
java -jar /home/pirate/blinkled/blinkled-1.0-all.jar

exit 0' > ./rc.local
sudo cp ./rc.local /etc/rc.local
sudo ifdown eth0
sudo ifup eth0
rm ./eth0
rm ./rc.local
rm ./kubernetes.list
curl -sS https://get.pimoroni.com/blinkt | bash
