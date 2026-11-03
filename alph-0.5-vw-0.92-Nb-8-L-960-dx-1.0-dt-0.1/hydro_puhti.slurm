#!/bin/bash -l
#SBATCH -n 480
#SBATCH -p large
## Name of your job
#SBATCH -J alph-0.5-vw-0.92-L-960-dx-1.0-dt-0.1
## System message output/error file
##SBATCH --mem-per-cpu=2500
#SBATCH --output=./log%j.txt
#SBATCH --mail-type=ALL
#SBATCH --mail-user=d.cutting@sussex.ac.uk
#SBATCH --account=project_2001563
## How long job takes, wallclock time hh:mm:ss
#SBATCH -t 16:00:00
## Run MPI executable on compute nodes
## option -n gives the number of processes (recommendation: multiplies of 24)
## Calculate the total number of cores and store it in variable ncores

(( ncores = $SLURM_NTASKS ))
echo "ncores = $ncores"
module load intel/19.0.4
module load fftw/3.3.8-mpi
module list


srun -n $ncores /users/dcutting/Projects/single-precision-3d-hydro-new-eta/run/hydro \
    /users/dcutting/Projects/single-precision-3d-hydro-new-eta/run/data/prl-runs/alph-0.5-vw-0.92-Nb-8-L-960-dx-1.0-dt-0.1/input-test-BAG \
    > globals.txt 
