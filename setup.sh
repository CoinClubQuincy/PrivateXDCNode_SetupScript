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

echo $puppeth
#run python script to set configuration parameters
echo "finnished Dependencies"
echo "Start python Script"

python3 $location/config.py $location


alias bootnode=/home/ubuntu/XDPoSChain/build/bin/bootnode
#bootnode -genkey bootnode.key

#cp info
#bootnode -nodekey ./bootnode.key

#Note - Make sure to add Public ip in enode-id (For connecting two different location nodes you should have to go with aws public ip)

echo "Node Setup Completed"





