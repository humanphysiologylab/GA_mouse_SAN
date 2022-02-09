#!/bin/sh
#SBATCH --time 00:10:00
#SBATCH --partition normal
#SBATCH -n1
#SBATCH --job-name make

module load gcc 

cd /data90t/users/rybashlykov/new_GA_lsoda/bondarenko/model
make clean && make
