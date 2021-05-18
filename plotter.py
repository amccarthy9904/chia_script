import subprocess

class Plotter:
    
    k = None
    b = None
    dirs = None
    start_dir = "/home/lron/repos/chia-blockchain"
    script_loc = "/home/lron/repos/chia_script/plot.sh"
    test_loc = "/home/lron/repos/chia_script/test.sh"
    
    def __init__(self, k, b, dirs):
        self.k = k
        self.b = b
        self.dirs = dirs
        
    def start(self):
        
        farm = self.dirs["f"]
        temp1 = self.dirs["t1"]
        temp2 = self.dirs["t2"]
        
        vars = [self.k, self.b, farm, temp1, temp2]
        for v in vars:
            print (v, end = '\t')
        
        plot_script = subprocess.Popen([self.script_loc, "-k", self.k, "-b", self.b, "-d", farm, "-t", temp1, "-r", temp2], stdout=subprocess.PIPE, stdin=subprocess.PIPE, executable="/bin/bash")
        
        while True:
            out = plot_script.stdout.readline()
            if out == '' and plot_script.poll() is not None:
                break
            if out:
                print(out.strip())
            
            
        plot_script.wait()
        exitcode = plot_script.returncode
        
        if exitcode == 0:
            return None
        else:
            print(f"Exit code bad - {exitcode}")    
        