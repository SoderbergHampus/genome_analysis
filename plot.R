# Script for plotting the result of our htseq

# Clear for a new run
rm(list=ls())
graphics.off()

# Imports
library(DESeq2)
library("genefilter")
library("RColorBrewer")
library("gplots")

# Load all the data
leaf_92 <- read.table(file = '/home/haso/Documents/genome_analysis/lab/htseq_output/htseq_92_output.txt',
                      sep = '\t',
                      header = FALSE)

roots_93 <- read.table(file = '/home/haso/Documents/genome_analysis/lab/htseq_output/htseq_93_output.txt',
                      sep = '\t',
                      header = FALSE)

stem_96 <- read.table(file = '/home/haso/Documents/genome_analysis/lab/htseq_output/htseq_96_output.txt',
                      sep = '\t',
                      header = FALSE)

aril_97 <- read.table(file = '/home/haso/Documents/genome_analysis/lab/htseq_output/htseq_97_output.txt',
                      sep = '\t',
                      header = FALSE)

# Merge all the data into one variable
merged <- merge(leaf_92, roots_93, by = 'V1')
merged <- merge(merged, stem_96, by = 'V1')
merged <- merge(merged, aril_97, by = 'V1')

# Remove the first five rows (Not gene results)
merged <- tail(merged, -5)

# Create a reg ex function to tidy up the rownames a bit
tidy_names = function(strings){
  step1 <- gsub("maker-", "", strings)
  step2 <- gsub("snap_masked-", "", step1)
  step3 <- gsub("pilon-snap-", "", step2)
  step4 <- gsub("pilon-processed-", "", step3)
  return(step4)
}

# Make the first column (genes) into the names of the rows instead, so we only have the data in the actual dataset
names_rows = merged[, 1]
names_rows <- tidy_names(names_rows)
merged = merged[,2:5]
rownames(merged) <- names_rows

# Rename the columns so things make a bit more sense
names_columns <- c('leaf_92', 'roots_93', 'stem_96', 'aril_97')
names(merged) <- names_columns


##### leaf
# Prepare metadata
meta_names <- names_columns[1:4]
meta_type <- c('leaf', 'not_leaf', 'not_leaf', 'not_leaf')

meta_column <- cbind.data.frame(meta_names, meta_type)

# Prepare the set for the final run
dds <- DESeqDataSetFromMatrix(countData = merged, colData = meta_column, design = ~ meta_type)

# Run the Deseq2 analysis
result <- DESeq(dds)
final_result <- results(result)
rld <- rlog(dds)

# Calculate distance between samples
sample_dist <- dist(t(assay(rld)))


# Lets get plotting
# Heatmap done only here because changing the meta_type made no difference.
top_var_genes <- head( order( rowVars( assay( rld) ), decreasing = TRUE), 35)
heatmap.2( assay( rld) [top_var_genes, ], scale = "row",
           trace = "none", dendrogram = "column",
           col = colorRampPalette( rev( brewer.pal(9, "RdBu"))) (255),
           margins = c(8, 15))

ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print( plotPCA( rld, intgroup = c("meta_type")))


##### Roots
# Prepare metadata
meta_names <- names_columns[1:4]
meta_type <- c('not_roots', 'roots', 'not_roots', 'not_roots')

meta_column <- cbind.data.frame(meta_names, meta_type)

# Prepare the set for the final run
dds <- DESeqDataSetFromMatrix(countData = merged, colData = meta_column, design = ~ meta_type)

# Run the Deseq2 analysis
result <- DESeq(dds)
final_result <- results(result)
rld <- rlog(dds)

# Calculate distance between samples
sample_dist <- dist(t(assay(rld)))


# Lets get plotting
ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print( plotPCA( rld, intgroup = c("meta_type")))


##### Stem
# Prepare metadata
meta_names <- names_columns[1:4]
meta_type <- c('not_stem', 'not_stem', 'stem', 'not_stem')

meta_column <- cbind.data.frame(meta_names, meta_type)

# Prepare the set for the final run
dds <- DESeqDataSetFromMatrix(countData = merged, colData = meta_column, design = ~ meta_type)

# Run the Deseq2 analysis
result <- DESeq(dds)
final_result <- results(result)
rld <- rlog(dds)

# Calculate distance between samples
sample_dist <- dist(t(assay(rld)))


# Lets get plotting
ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print( plotPCA( rld, intgroup = c("meta_type")))


######## aril
# Prepare metadata
meta_names <- names_columns[1:4]
meta_type <- c('not_aril', 'not_aril', 'not_aril', 'aril')

meta_column <- cbind.data.frame(meta_names, meta_type)

# Prepare the set for the final run
dds <- DESeqDataSetFromMatrix(countData = merged, colData = meta_column, design = ~ meta_type)

# Run the Deseq2 analysis
result <- DESeq(dds)
final_result <- results(result)
rld <- rlog(dds)

# Calculate distance between samples
sample_dist <- dist(t(assay(rld)))


# Lets get plotting
ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print( plotPCA( rld, intgroup = c("meta_type")))