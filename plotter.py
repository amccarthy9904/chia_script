import os

class Plotter:
    
    k = None
    b = None
    dirs = None
    
    def __init__(self, k, b, dirs):
        self.k = k
        self.b = b
        self.dirs = dirs
        
    def start(self):
        print("started" + self.dirs["r"])