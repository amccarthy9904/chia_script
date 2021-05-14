
import os
from plotter import Plotter
from prepper import Prepper
import logging
import threading
import time


def plot_thread():
    
    file = open("properties.ini")
    props = []
    new_props = []
    for i,line in enumerate(file):
        
        if i == 1:
            new_props.append(str(int(line.strip()) + 1)) 
            
        else:
            new_props.append(line.strip())
        
        if line[0] != "#":
            props.append(line.strip())
            
    # write to new props file, or look into configparser
    props = {"n":props[0], "k":props[1], "b":props[2], "f":props[3]}
    print(props)
    prep = Prepper(props["n"], props["f"])
    dirs = prep.prep()
    print(dirs)
    plot = Plotter(props["k"], props["b"], dirs)
    plot.start()
    
    prep.clean()


if __name__ == "__main__":
    print("ASDASD")
    plot_thread()

