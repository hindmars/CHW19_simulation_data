#!/bin/bash -l
#SBATCH -n 1920
#SBATCH -p large
## Name of your job
#SBATCH -J alph-0.5-vw-0.44-L-1920-dx-0.5-movie
## System message output/error file
#SBATCH --output=./log%j.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=d.cutting@sussex.ac.uk
## How long job takes, wallclock time hh:mm:ss
#SBATCH -t 30:00:00
## Run MPI executable on compute nodes
## option -n gives the number of processes (recommendation: multiplies of 24)
## Calculate the total number of cores and store it in variable ncores

(( ncores = 1920 ))
echo "ncores = $ncores"
srun -n $ncores /homeappl/home/dcutting/Projects/single-precision-3d-hydro-new-eta/run/hydro \
    /homeappl/home/dcutting/Projects/single-precision-3d-hydro-new-eta/run/data/alph-0.5-vw-0.44-Nb-8-L-1920-dx-0.5-movie/input-test-BAG \
    > globals.txt 
