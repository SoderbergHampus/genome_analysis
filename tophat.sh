#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 07:00:00
#SBATCH -J tophat_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules
module load bioinfo-tools
module load bowtie2
module load samtools
module load tophat/2.1.1

# Create the loop to run tophat for all the trimmed transcriptome files
for file in /home/haso0365/data/raw_data/transcriptome/trimmed/*11.1.fastaq.gz
do
	new_file="$(sed 's/11\.1/11.2' <<<$file)"
	output=$(basename $file)
	tophat \
		-o /home/haso0365/analysis/tophat/output_${output%.fastaq.gz} \
		-p 4 /home/haso0365/analysis/genome_assembly/bowtie_indexed/indexed_genome
done

