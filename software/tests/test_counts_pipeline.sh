#!/bin/bash

for SAMPLE in CTRL2-dil-500 CTRL48-dil-1000 CTRL48 CTRL2 CTRL23 CTRL14 
do
	miniwdl run \
		--dir /home/SeqLaptop/sequencing/output/sample_run/align_and_count_${SAMPLE}/. \
		viral-pipelines/pipes/WDL/workflows/align_and_count.wdl \
		align_and_count.reads_bam=/home/SeqLaptop/sequencing/output/sample_run/fastq_to_ubam_${SAMPLE}/call-FastqToUBAM/work/${SAMPLE}.bam \
		align_and_count.ref_db=/home/SeqLaptop/sequencing/resources/sdsi_spike-ins_2021-08-09_update.fasta
done
