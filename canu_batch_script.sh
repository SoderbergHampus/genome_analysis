#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 20:00:00
#SBATCH -J canu_alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user hampus.soderberg.0361@student.uu.se

# Load modules
module load bioinfo-tools
module load canu/1.7

# Commands
canu \
	-p canu_genome_assembly \
	-d /home/haso0365/analysis/genome_assembly/canu \
	genomeSize=36M \
	-pacbio-raw /home/haso0365/data/raw_data/pacbio/SRR6037732_scaffold_11.fq.gz
