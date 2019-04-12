# Path to the trimomatic.jar
trim_path='/sw/apps/bioinfo/trimmomatic/0.36/rackham/trimmomatic.jar'

# Path to input
fwd_input_path='/home/haso0365/data/raw_data/transcriptome/untrimmed/SRR6040095_scaffold_11.1.fastq.gz'

rev_input_path='/home/haso0365/data/raw_data/transcriptome/untrimmed/SRR6040095_scaffold_11.2.fastq.gz'

# Output path and baseout
output_path='/home/haso0365/data/raw_data/transcriptome/trimmed/SRR6040095_scaffold_11.fastq.gz'

# Run the command
java -jar $trim_path PE \
	-threads 2 \
	$fwd_input_path \
	$rev_input_path \
	-baseout $output_path \
	LEADING:3 \
	TRAILING:3
