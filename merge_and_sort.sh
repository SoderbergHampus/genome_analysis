#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J merge_and_sort_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules
module load bioinfo-tools
module load samtools


# Do the merge
samtools merge \
	/home/haso0365/analysis/tophat/merged/merged_accepted_hits.bam \
	/home/haso0365/analysis/tophat/output/output_SRR6040092_scaffold_11.1/accepted_hits.bam \
	/home/haso0365/analysis/tophat/output/output_SRR6040093_scaffold_11.1/accepted_hits.bam \
	/home/haso0365/analysis/tophat/output/output_SRR6040096_scaffold_11.1/accepted_hits.bam \
	/home/haso0365/analysis/tophat/output/output_SRR6040097_scaffold_11.1/accepted_hits.bam

# Sort the output of the merge
samtools sort \
	-o /home/haso0365/analysis/tophat/merged_and_sorted/merged_sorted_transciptome.bam \
	/home/haso0365/analysis/tophat/merged/merged_accepted_hits.bam

