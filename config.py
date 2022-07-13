#!/usr/bin/env python
import yaml
import subprocess
import sys

class NodeSetup:
    def __init__(self,location):
        self.location = location
        subprocess.run("alias XDC=/home/ubuntu/XDPoSChain/build/bin/XDC", shell=True) #XDC Path
        subprocess.run("alias bootnode=/home/ubuntu/XDPoSChain/build/bin/bootnode", shell=True)#Bootnode
        subprocess.run("alias puppeth=/home/ubuntu/XDPoSChain/build/bin/puppeth", shell=True) #Puppeth
    
        subprocess.run("/home/ubuntu/XDPoSChain/build/bin/puppeth",stdin=None, input=None, stdout=None,
                                stderr=None, capture_output=False, shell=False, 
                                cwd=None, timeout=None, check=False, encoding=None, 
                                errors=None, text=None, env=None, universal_newlines=None)
        self.shellScript(self.location)
        
    def readConfig(self,_file_location):
        print("reading config file")
        with open("%s/config.yml" % (_file_location[:-9]), "r") as stream:
            doc = yaml.safe_load(stream)
            try:
                for signers, value in doc.items():
                    if(signers == "Nodes" ):
                        print("break")
                        break                        
                    elif(isinstance(value, list)==True):
                        for i in value:
                            subprocess.run([i],shell=False)
                            #print(i)
                    else:
                        subprocess.run(doc[value],shell=False)
                        #print(value)
            except yaml.YAMLError as exc:
                print(exc)
    
    def establishNodes(self):
        print("listing Nodes")

    def shellScript(self,_location):
        self.readConfig(_location)
        self.establishNodes()
    
if __name__ == "__main__":
    NodeSetup(sys.argv[0])
