#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:00:00
#SBATCH -J sort_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules
module load bioinfo-tools
module load samtools

# Sort the relevant files
samtools sort \
	-o /home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040092_scaffold_11.1.bam \
	/home/haso0365/analysis/tophat/output/output_SRR6040092_scaffold_11.1/accepted_hits.bam

samtools sort \
        -o /home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040093_scaffold_11.1.bam \
        /home/haso0365/analysis/tophat/output/output_SRR6040093_scaffold_11.1/accepted_hits.bam 

samtools sort \
        -o /home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040096_scaffold_11.1.bam \
        /home/haso0365/analysis/tophat/output/output_SRR6040096_scaffold_11.1/accepted_hits.bam 

samtools sort \
        -o /home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040097_scaffold_11.1.bam \
        /home/haso0365/analysis/tophat/output/output_SRR6040097_scaffold_11.1/accepted_hits.bam 

