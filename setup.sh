#!/usr/bin/env bash

# install python and python dpendancies
#yes |
location=$(pwd)
cd ../
#Basic updates
sudo apt-get update
sudo apt update
yes | sudo apt upgrade
sudo apt-get update
sudo apt-get update -y
sudo apt-get update --fix-missing
sudo apt-get install make
#bootload dependancies
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install bootnode
#remove olg Go
yes | sudo apt-get remove golang-go
yes | sudo apt-get remove --auto-remove golang-go

yes | sudo apt install golang make git
yes | sudo apt install rpm

#python dependacies
sudo apt-get -y install python3-pip
sudo apt-get install python3.6
pip3 install pyinstaller

#Go dependancies
wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
tar -C /home/ubuntu -xzf go1.15.5.linux-amd64.tar.gz

#Create shortcuts for easier access
export GOROOT=/home/ubuntu/go
export GOPATH=/home/ubuntu/go
export PATH=$PATH:/usr/local/go/bin]
export PATH="${GOROOT}/bin:${PATH}"

git clone https://github.com/XinFinOrg/XDPoSChain 
cd XDPoSChain
git checkout v1.4.4

sudo apt-get install build-essential
sudo apt-get install make
sudo apt-get install gcc

make all

#Prepare Test Network Software
cd ../

git clone https://github.com/XDCFoundation/xdc-testnetwork-leo.git
cd xdc-testnetwork-leo

#Customize the Genesis file Using the Puppeth Tool -
cd /home/ubuntu/xdc-testnetwork-leo/genesis
#Delete the existing Genesis file
rm -rf genesis.json


#run python script to set configuration parameters
echo "finnished Dependencies"
echo "Skip python Script"

#echo "2/3rd complete: BREAK: still testing finnish manually until finnished"
#break ## still testing do manually untill finnished
nodeAmmount=$(python3 $location/config.py $location)
echo "$nodeAmmount"

bootnode -genkey bootnode.key
bootnode -nodekey ./bootnode.key

#Set up master node
for (( i=1; i<=$nodeAmmount; i++ ))
do 
    echo "Setting up Node $i"
    chmod 777 node$i.sh
    bash node$i.sh
done

#Set up Faucet Backend
git clone https://github.com/XDCFoundation/xdc-faucet-leo-backend.git
npm install
npm run dev

#Set up Faucet Frontend
git clone https://github.com/XDCFoundation/xdc-faucet-leo.git
npm start

echo "Node Setup Completed"





