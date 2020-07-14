###################### Install jenkins and packages for jenkins And a few more ##########################
#!/bin/bash

echo "<< Updating now >>"
sudo apt update

echo "<< Install java11 >>"
sudo apt install openjdk-11-jdk

echo "<< Install ssh-pass >>"
sudo apt-get install sshpass -y

echo "<< Install python3.7 >>"
sudo apt install python3.7
python3.7 --version

echo "<< Make python3.7 default >>"
alias python==python3.7

echo "<< Install jenkins >>"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
echo "<< Need to update again >>"
sudo apt update
sudo apt install jenkins
systemctl status jenkins

echo '#JENKINS_HOME=/var/lib/$NAME          ### Changes the jenkins home directory
JENKINS_HOME=/home/jenkins">/etc/default/jenkins '
echo "<< create key-gen >>"
sudo ssh-keygen
echo "<< Creates a jenkins user and puts it in a root and sudo group >>"
sudo useradd jenkins
usermod -a -G sudo jenkins                  ### Add jenkins to sudo group
usermod -a -G root jenkins                  ### Add jenkins to root group
chmod 777 jenkins                           ### Give jenkins Permissions

echo "<< Enables Port 8080 >>"
sudo ufw allow 8080                   ### Enables Port 8080

echo "<< install pip3 & boto3 & paramiko >>"
sudo apt install python3-pip
pip3 --version
pip3 install boto3
pip install paramiko

echo "<< install Tcpdump >>"
apt-get install tcpdump
