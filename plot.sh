#!/bin/sh

# k - plot size - 32
# b - RAM - 5.5GB for now
# d - farm path - /media/lron/farm1/f1.n
# t1 - temp dir 1
# t2 - temp dir 2

# goal of script is to run this:
# chia plots create -k 32 -b 5500 -d <FARM_DIR> -t <TEMP_DIR1> -2 <TEMP_DIR2>

helpFunction()
{
   echo ""
   echo "Usage: $0 -k plot size; -b RAM; -d farm path"
   echo -e "\t-t1 temp dir 1; -t2 temp dir 2"
   echo -e "\t-k plot size final size of plot in made up units, 32"
   echo -e "\t-b RAM allocation for process in MB, 5500"
   echo -e "\t-d final farm directory, /media/lron/farm1/f1.n"
   exit 1 # Exit script after printing help
}

echo "attempt start"
while getopts k:b:d:t:r: flag

do
    case "${flag}" in
        k ) size=${OPTARG};;
        b ) ram=${OPTARG};;
        d ) farm=${OPTARG};;
        t ) temp1=${OPTARG};;
        r ) temp2=${OPTARG};;
        # ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
    esac
done

# Print helpFunction in case parameters are empty
if [ -z "$size" ] || [ -z "$ram" ] || [ -z "$farm" ] || [ -z "$temp1" ] || [ -z "$temp2" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi
echo "asda"
# Begin script in case all parameters are correct
# $chia_dir = "/home/lron/repos/chia-blockchain"
cd "/home/lron/repos/chia-blockchain"
echo $PWD
source /home/lron/repos/chia-blockchain/venv/bin/activate
chia plots create -k "$size" -b "$ram" -d "$farm" -t "$temp1" -2 "$temp2"
exit 1