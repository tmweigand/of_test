#!/bin/bash
#SBATCH --job-name=mp1-1000
#SBATCH -p batch
#SBATCH -t 08:00:00
#SBATCH -n 2000
#SBATCH --mem-per-cpu=4G

nProcs=2000
logdir=logs

echo "Sourcing OF-v2406 bashrc"
source ~/OpenFOAM/OpenFOAM-v2406/etc/bashrc

mpirun -np ${nProcs} snappyHexMesh -overwrite -parallel > ${logdir}/log.snappyHexMesh
mpirun -np ${nProcs} checkMesh -parallel > ${logdir}/log.checkMesh


