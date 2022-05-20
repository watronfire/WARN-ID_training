#!/bin/bash

for SAMPLE in CTRL2-dil-500 CTRL48-dil-1000 CTRL2 CTRL23 CTRL14 CTRL48
do
	miniwdl run \
		--dir /home/SeqLaptop/sequencing/output/sample_run/fastq_to_ubam_${SAMPLE}/. \
		viral-pipelines/pipes/WDL/workflows/fastq_to_ubam.wdl \
		FastqToUBAM.fastq_1=/home/SeqLaptop/sequencing/input/sample_run/${SAMPLE}_spikein_R1.fastq.gz \
		FastqToUBAM.fastq_2=/home/SeqLaptop/sequencing/input/sample_run/${SAMPLE}_spikein_R2.fastq.gz \
		FastqToUBAM.sample_name=${SAMPLE} \
		FastqToUBAM.library_name=${SAMPLE} \
		FastqToUBAM.platform_name=ILLUMINA
done
