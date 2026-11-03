#!/bin/bash -l
#SBATCH -n 2560
#SBATCH -p large
## Name of your job
#SBATCH -J alph-0.5-vw-0.44-Nb-8-L-1280-dx-0.75
## System message output/error file
#SBATCH --output=./log%j.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=d.cutting@sussex.ac.uk
#SBATCH --account=project_2001563
## How long job takes, wallclock time hh:mm:ss
#SBATCH -t 8:00:00
## Run MPI executable on compute nodes
## option -n gives the number of processes (recommendation: multiplies of 24)
## Calculate the total number of cores and store it in variable ncores

(( ncores = 2560 ))
echo "ncores = $ncores"
module load intel/19.0.4
module load hpcx-mpi
module load fftw/3.3.8-mpi
module list

srun /users/dcutting/Projects/single-precision-3d-hydro-new-eta/run/hydro \
    /users/dcutting/Projects/single-precision-3d-hydro-new-eta/run/data/prl-runs/alph-0.5-vw-0.44-Nb-8-L-1280-dx-0.75/input-test-BAG \
    > globals.txt
