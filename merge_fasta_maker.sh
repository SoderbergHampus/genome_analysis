#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J merge_maker_fasta_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules
module load bioinfo-tools
module load maker

# Ensure we're in the right directory
cd /home/haso0365/code/genome_analysis/maker_third_run/third_maker_output/

# Run the merge
fasta_merge -d pilon_output_master_datastore_index.log

