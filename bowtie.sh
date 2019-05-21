# Load modules
module load bioinfo-tools
module load bowtie2

bowtie2-build \
	/home/haso0365/analysis/genome_assembly/pilon/pilon_output.fasta \
	indexed_genome
