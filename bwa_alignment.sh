#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J bwa_alignment
#SBATCH --mail-type=ALL
#SBATCH --mail-user hampus.soderberg.0361@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa/0.7.17

# Commands

bwa mem /home/haso0365/analysis/genome_assembly/canu/canu_genome_assembly.contigs.fasta /home/haso0365/data/raw_data/illumina/SRR6058604_scaffold_11.1P.fastq.gz /home/haso0365/data/raw_data/illumina/SRR6058604_scaffold_11.2P.fastq.gz > /home/haso0365/analysis/bwa_alignment/bwa_output.sam
