#!/bin/bash
#SBATCH --job-name="domain_generation"
#SBATCH --output="domain_generation.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=16
#SBATCH --ntasks-per-node=128
#SBATCH --mem=0 
#SBATCH --account=nca125
#SBATCH --export=ALL
#SBATCH -t 12:00:00

# /expanse/lustre/projects/nca125/tweigand

nProcs=2000
logdir=logs

echo "Sourcing OF-v2406 bashrc"
source ~/OpenFOAM-v2406/etc/bashrc

mpirun -np ${nProcs} snappyHexMesh -overwrite -parallel > ${logdir}/log.snappyHexMesh
mpirun -np ${nProcs} checkMesh -parallel > ${logdir}/log.checkMesh


