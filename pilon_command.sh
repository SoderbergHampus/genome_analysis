# Command to run the pilon genome assembly, not that their is a script to prepare the bam files that needs to be done before this.
pilon \
--genome /home/haso0365/analysis/genome_assembly/canu/canu_genome_assembly.contigs.fasta \
--bam /home/haso0365/analysis/bwa_alignment/bwa_output_sorted.bam \
--diploid \
--threads 2 \
--output pilon_output \
--outdir /home/haso0365/analysis/genome_assembly/pilon \
