# 1. Convert the sam file to a bam file
samtools view -S -b filename.sam > filename.bam

# 2. Sort the bam file 
samtools sort filename.bam > filename_sorted.bam

# 3. Index the file
samtools index filename.bam  # Maybe full path

# Then pilon, refer to the seperate pilon run command script
