#!/bin/bash
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -C cpu
#SBATCH -q shared
#SBATCH -A alice
#SBATCH -J jetphox_submit
#SBATCH -t 02:00:00

RUNOPTIONS=""
for var in "$@"
do
    RUNOPTIONS="$RUNOPTIONS $var"
done


time /global/u1/f/fjonas/pyphox/run_jetphox submitperlmutter $RUNOPTIONS

