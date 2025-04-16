#!/bin/bash
#SBATCH --job-name="domain_generation"
#SBATCH --output="domain_generation.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --mem=0 
#SBATCH --account=nca125
#SBATCH --export=ALL
#SBATCH -t 01:00:00

#srun --partition=debug  --pty  --account=nca125 --nodes=1 --ntasks-per-node=4     --mem=8G -t 01:00:00 --wait=0 --export=ALL /bin/bash
# /expanse/lustre/projects/nca125/tweigand

module purge
module load cpu

#Load module file(s) into the shell environment
module load slurm
module load cpu/0.17.3b  gcc/10.2.0/npcyll4
module load openmpi/4.1.1

echo "Sourcing OF-v2406 bashrc"
source ~/OpenFOAM-v2406/etc/bashrc

logdir=logs
mkdir ${logdir}
blockMesh > ${logdir}/log.blockMesh
decomposePar > ${logdir}/log.decomposePar

