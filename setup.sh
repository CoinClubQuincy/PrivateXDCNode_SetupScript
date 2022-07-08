# install python and python dpendancies
location=$(pwd)

sudo apt-get update
sudo apt update
sudo apt upgrade

sudo apt-get install python3.6

pip3 install pynput
#create and open DeployNode directory
mkdir DeployNode
cd DeployNode
#install Go lang
sudo snap install go --classic
sudo apt install golang-go

#Create shortcuts for easier access
export GOROOT=/usr/local/go
export GOPATH=/home/ubuntu/go
export PATH=$PATH:/usr/local/go/bin
#XDC Path
alias XDC=/home/ubuntu/XDPoSChain/build/bin/XDC
#Bootnode
alias bootnode=/home/ubuntu/XDPoSChain/build/bin/bootnode
#Puppeth
alias puppeth=/home/ubuntu/XDPoSChain/build/bin/puppeth
#Prepare Test Network Client Software
git clone https://github.com/XinFinOrg/XDPoSChain
cd XDPoSChain
git checkout v1.4.4
sudo su
apt-get install build-essential
apt-get update
apt-get install make
apt-get install gcc
#Set go paths for make all (Step 2)
make all
#Prepare Test Network Software
cd ~home/ubuntu

git clone https://github.com/XDCFoundation/xdc-testnetwork-leo.git
cd xdc-testnetwork-leo

#Customize the Genesis file Using the Puppeth Tool -
cd /home/ubuntu/xdc-testnetwork-leo/genesis
#Delete the existing Genesis file
rm -rf genesis.json
#Set Path for Puppeth tool
alias puppeth=/home/ubuntu/XDPoSChain/build/bin/puppeth
puppeth
#run python script to set configuration parameters

Python3 $location/config.py $location


