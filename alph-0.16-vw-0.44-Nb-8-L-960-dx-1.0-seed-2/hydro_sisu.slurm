#!/bin/bash -l
#SBATCH -n 960
#SBATCH -p large
## Name of your job
#SBATCH -J alph-0.16-vw-0.44-L-960-dx-1.0-seed-2
## System message output/error file
#SBATCH --output=./log%j.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=d.cutting@sussex.ac.uk
## How long job takes, wallclock time hh:mm:ss
#SBATCH -t 4:00:00
## Run MPI executable on compute nodes
## option -n gives the number of processes (recommendation: multiplies of 24)
## Calculate the total number of cores and store it in variable ncores

(( ncores = 960 ))
echo "ncores = $ncores"
srun -n $ncores /homeappl/home/dcutting/Projects/single-precision-3d-hydro-new-eta/run/hydro \
    /homeappl/home/dcutting/Projects/single-precision-3d-hydro-new-eta/run/data/alph-0.16-vw-0.44-Nb-8-L-960-dx-1.0-seed-2/input-test-BAG \
    > globals.txt 
