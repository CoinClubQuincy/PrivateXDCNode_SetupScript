#!/usr/bin/env python
import yaml
import subprocess
from pynput.keyboard import Key, Controller

class NodeSetup:
    def __init__(self):
        print("test")
        self.shellScript()

    def readConfig(self):
        print("reading config file")
        with open("config.yml", "r") as stream:
            doc = yaml.safe_load(stream)
            try:
                for signers, value in doc.items():
                    if(isinstance(value, list)==True):
                        for i in value:
                            ##subprocess.run([i])
                            print(i)
                        #enter key to continue to next item
                        Key.enter
                    else:
                        #subprocess.run([doc[value]])
                        print(value)
            except yaml.YAMLError as exc:
                print(exc)

    def shellScript(self):
        print("execute shell")
        subprocess.run(['ls'])
        self.readConfig()
    
if __name__ == "__main__":
    NodeSetup()