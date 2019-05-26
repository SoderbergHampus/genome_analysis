#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J fastqc_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules
module load bioinfo-tools
module load FastQC

fastqc -o /home/haso0365/analysis/fastqc_output/untrimmed/ \
	/home/haso0365/data/raw_data/transcriptome/untrimmed/SRR6040095_scaffold_11.1.fastq.gz \
	/home/haso0365/data/raw_data/transcriptome/untrimmed/SRR6040095_scaffold_11.2.fastq.gz

fastqc -o /home/haso0365/analysis/fastqc_output/trimmed/ \
        /home/haso0365/data/raw_data/transcriptome/trimmed/SRR6040095_scaffold_11.1.fastq.gz \
        /home/haso0365/data/raw_data/transcriptome/trimmed/SRR6040095_scaffold_11.2.fastq.gz


