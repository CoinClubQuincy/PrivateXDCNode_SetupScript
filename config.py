#!/usr/bin/env python
import yaml
import subprocess
import sys

class NodeSetup:
    def __init__(self,location):
        OPTIONS = {'includes': ['pynput.keyboard._darwin', 'pynput.mouse._darwin']}
        self.location = location
        subprocess.run("puppeth")
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
                            subprocess.run([i])
                            #print(i)
                    else:
                        subprocess.run([doc[value]])
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
