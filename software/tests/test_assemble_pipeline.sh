#!/bin/bash

for SAMPLE in CTRL48-dil-1000 CTRL48 CTRL2 CTRL23 CTRL14
do
	miniwdl run \
	  --dir /home/SeqLaptop/sequencing/output/sample_run/assemble_refbased_${SAMPLE}/. \
		viral-pipelines/pipes/WDL/workflows/assemble_refbased.wdl \
	  reads_unmapped_bams=/home/SeqLaptop/sequencing/output/sample_run/fastq_to_ubam_${SAMPLE}/call-FastqToUBAM/work/${SAMPLE}.bam \
		reference_fasta=/home/SeqLaptop/sequencing/resources/sars-cov-2_reference.fasta \
		trim_coords_bed=/home/SeqLaptop/sequencing/resources/sc2_primers.bed \
		sample_name=${SAMPLE}
done
