#!/bin/sh
#SBATCH --time 12:00:00
#SBATCH --partition normal
#SBATCH -n128 -N8
#SBATCH --job-name gonotkov_ga_fit
#SBATCH --comment pacemaker_genetic_algorithms

cd /data90t/users/rybashlykov/new_GA_lsoda/bondarenko/model
make clean && make

cd /data90t/users/rybashlykov/new_GA_lsoda/bondarenko

mpiexec python mpi_script.py /data90t/users/rybashlykov/new_GA_lsoda/bondarenko/configs/shifts_model1.json
