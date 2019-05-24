# Script with the commands I just directly in the command line to train snap and go from the first to the second maker run.

# Created the GFF3 file containing gene predictions with
gff3_merge -d pilon_output_master_datastore_index.log

# Generating files for training SNAP:
maker2zff pilon_output.all.gff

# Validating with fathom:
fathom genome.ann genome.dna -validate > snap_validate_output.txt

# Identify errors:
cat snap_validate_output.txt | grep "error"

# Remove errors:
grep -vwE "MODEL491" genome.ann > genome.ann2
grep -vwE "MODEL1046" genome.ann2 > genome.ann3

# See if errors are fixed:
fathom genome.ann3 genome.dna -validate
rm genome.ann2 genome.ann
mv genome.ann3 genome.ann

# Create the rest of SNAPs input files:
fathom genome.ann genome.dna -categorize 1000
fathom uni.ann uni.dna -export 1000 -plus
forge export.ann export.dna

# Train snap with hmm-assembler:
hmm-assembler.pl /home/haso0365/analysis/genome_assembly/pilon/pilon_output.fasta . > pilon_output.hmm

# I then updated the .ctl file according to the guide

# Finally ran my maker_run.sh script again just as before

