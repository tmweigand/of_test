#!/bin/bash
#SBATCH --job-name=p1-1000
#SBATCH -p small
#SBATCH -t 01:00:00
#SBATCH -n 2
#SBATCH -N 1
#SBATCH --mem=100G

logdir=logs

echo "Sourcing OF-v2406 bashrc"
source ~/OpenFOAM/OpenFOAM-v2406/etc/bashrc

mkdir ${logdir}
blockMesh > ${logdir}/log.blockMesh
decomposePar > ${logdir}/log.decomposePar

