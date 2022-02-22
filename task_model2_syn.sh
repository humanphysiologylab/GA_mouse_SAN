#!/bin/sh
#SBATCH --time 10:00:00
#SBATCH --partition normal
#SBATCH -n128 -N8
#SBATCH --job-name GA_syn
#SBATCH --comment pacemaker_genetic_algorithms

cd /data90t/users/rybashlykov/new_GA_lsoda/bondarenko

mpiexec python mpi_script.py /data90t/users/rybashlykov/new_GA_lsoda/bondarenko/configs/syn_model2.json
