#!/bin/sh
helpFunction()
{
   echo ""
   echo "Usage: $0 -k plot size"
   echo -e "\t-k plot size final size of plot in made up units, 32"
   exit 1 # Exit script after printing help
}

echo "attempt start"
while getopts k: flag

do
    case "${flag}" in
        k ) size=${OPTARG};;
        # ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
    esac
done

# Print helpFunction in case parameters are empty
if [ -z "$size" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
# $chia_dir = "/home/lron/repos/chia-blockchain"
cd "/home/lron/repos/chia-blockchain"
echo $PWD
echo $size
exit 1