#!/bin/bash

miniwdl run \
	--dir /home/seqlaptop/sequencing/output/sample_run/align_and_count_multiple_report/. \
	viral-pipelines/pipes/WDL/workflows/align_and_count_multiple_report.wdl \
	reads_unmapped_bams=/home/seqlaptop/sequencing/output/sample_run/fastq_to_ubam_CTRL2-dil-500/call-FastqToUBAM/work/CTRL2-dil-500.bam \
	reads_unmapped_bams=/home/seqlaptop/sequencing/output/sample_run/fastq_to_ubam_CTRL48-dil-1000/call-FastqToUBAM/work/CTRL48-dil-1000.bam \
	reads_unmapped_bams=/home/seqlaptop/sequencing/output/sample_run/fastq_to_ubam_CTRL48/call-FastqToUBAM/work/CTRL48.bam \
	reads_unmapped_bams=/home/seqlaptop/sequencing/output/sample_run/fastq_to_ubam_CTRL2/call-FastqToUBAM/work/CTRL2.bam \
	reads_unmapped_bams=/home/seqlaptop/sequencing/output/sample_run/fastq_to_ubam_CTRL23/call-FastqToUBAM/work/CTRL23.bam \
	reads_unmapped_bams=/home/seqlaptop/sequencing/output/sample_run/fastq_to_ubam_CTRL14/call-FastqToUBAM/work/CTRL14.bam \
	ref_db=/home/seqlaptop/sequencing/resources/sdsi_spike-ins_2021-08-09_update.fasta
