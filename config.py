#!/usr/bin/env python
import yaml
import subprocess

class NodeSetup:
    def __init__(self):
        print("test")
        self.shellScript()

    def readConfig(self):
        print("reading config file")
        with open("config.yml", "r") as stream:
            try:
                #print(yaml.safe_load(stream))
                print("file loaded")
            except yaml.YAMLError as exc:
                print(exc)

    def shellScript(self):
        print("execute shell")
        subprocess.call(['ls'])
        self.readConfig()
    
if __name__ == "__main__":
    NodeSetup()