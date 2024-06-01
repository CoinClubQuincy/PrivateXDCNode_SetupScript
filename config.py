#!/usr/bin/env python3
import yaml
import subprocess
import sys

total = 4
class NodeSetup:
    def __init__(self,location):
        self.location = location

        subprocess.run("alias bootnode=/home/ubuntu/XDPoSChain/build/bin/bootnode", shell=True) #Bootnode Path
        subprocess.run("alias XDC=/home/ubuntu/XDPoSChain/build/bin/XDC", shell=True) #XDC Path
        subprocess.run("alias bootnode=/home/ubuntu/XDPoSChain/build/bin/bootnode", shell=True)#Bootnode
        subprocess.run("alias puppeth=/home/ubuntu/XDPoSChain/build/bin/puppeth", shell=True) #Puppeth
        subprocess.run("alias bootnode=/home/ubuntu/XDPoSChain/build/bin/bootnode",shell=True) #Boot node

        #self.shellScript(self.location)
        
    def readConfig(self,_file_location):
        print("reading config file")
        with open("%s/config.yml" % (_file_location[:-9]), "r") as stream:
            doc = yaml.safe_load(stream)
            try:
                for signers, value in doc.items():
                    if(signers == "Total_Nodes" ):
                        print("break")
                        global total 
                        total = value
                        break

                    elif(isinstance(value, list)==True):
                        for i in value:
                            #subprocess.run([i],shell=False)
                            print(i)
                    else:
                        #subprocess.run(value,shell=False)
                        print(value)
                
            except yaml.YAMLError as exc:
                print(exc)
    
    def establishNodes(self):
        return total

    def shellScript(self,_location):
        self.readConfig(_location)
    

genesisFile = {
    "name": "sathiyajith",
    "rollno": 56,
    "cgpa": 8.6,
    "phonenumber": "9976770500"
}



if __name__ == "__main__":
    node=NodeSetup(sys.argv[0])
    node.establishNodes()
