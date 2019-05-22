#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 07:00:00
#SBATCH -J trinity_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules
module load bioinfo-tools
module load trinity

# Run the actual assembly using trinity
trinity \
	--genome_guided_bam /home/haso0365/analysis/tophat/merged_and_sorted/merged_sorted_transciptome.bam \
	--output /home/haso0365/analysis/trinity/trinity_out/	
	--max_memory <some_value> \
	--genome_guided_max_intron <some value> \
	--CPU 4

