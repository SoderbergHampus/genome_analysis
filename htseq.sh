#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J htseq_haso0365
#SBATCH --mail-type=ALL
#SBATCH --mail-user jimmyhampussoderberg@gmail.com

# Load modules 
module load bioinfo-tools
module load htseq

# Run the htseq command on the 4 relevant scaffolds
htseq-count \
	-f bam \
	-r pos \
	-o /home/haso0365/analysis/htseq_output/htseq_92_output.sam \
	-t exon \
	/home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040092_scaffold_11.1.bam \
	/home/haso0365/analysis/third_maker_gff/pilon_output.all.gtf \
	> /home/haso0365/analysis/htseq_output/htseq_92_output.txt

htseq-count \
        -f bam \
        -r pos \
        -o /home/haso0365/analysis/htseq_output/htseq_93_output.sam \
        -t exon \
	/home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040093_scaffold_11.1.bam \
        /home/haso0365/analysis/third_maker_gff/pilon_output.all.gtf \
        > /home/haso0365/analysis/htseq_output/htseq_93_output.txt

htseq-count \
        -f bam \
        -r pos \
        -o /home/haso0365/analysis/htseq_output/htseq_96_output.sam \
	-t exon \
        /home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040096_scaffold_11.1.bam \
        /home/haso0365/analysis/third_maker_gff/pilon_output.all.gtf \
        > /home/haso0365/analysis/htseq_output/htseq_96_output.txt

htseq-count \
        -f bam \
        -r pos \
        -o /home/haso0365/analysis/htseq_output/htseq_97_output.sam \
	-t exon \
        /home/haso0365/analysis/tophat/only_sorted/sorted_SRR6040097_scaffold_11.1.bam \
        /home/haso0365/analysis/third_maker_gff/pilon_output.all.gtf \
        > /home/haso0365/analysis/htseq_output/htseq_97_output.txt


