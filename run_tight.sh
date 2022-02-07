#!/bin/bash

mpiexec -np 16 python ./bondarenko/mpi_script.py ./bondarenko/configs/pacemaker_model1_tight.json

