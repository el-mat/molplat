#!/bin/bash

display_usage() { 
	echo "This script creates a html file summarizing fastqc data from multiple zipped fastq files (as recieved by the sequencing facility). It takes 1 argument a path to the fastq files" 
	echo -e "\nUsage:\n$0 [arguments] \n" 
	} 

file=$1

if [ $# -lt 1 ]; then
	echo "Not enough arguments"
	echo -e "\n"
	display_usage
	exit 1
elif [ $# -gt 1 ]; then
	echo "Too much arguments"
	echo -e "\n"
	display_usage
	exit 1
fi

PATH=$PATH:/opt/

cd $file

if [ -e *.fastq.gz ]; then
	echo "Unzip fastq files"
	for f in *.fastq.gz; do gunzip $f; done
else 
	echo "Fastq files were already unzipped or are in a different format"
fi

if [ ! -e *_fastqc.html ]; then
	echo "Running fastqc"
	fastqc *.fastq
else 
	echo "fastqc was already done"
fi

if [ ! -e multiqc_report.html ]; then
	echo "Running multiqc"
	multiqc .
else
	echo "multiqc report was already generated"
fi

rm -r *_fastqc.html
rm -r *_fastqc.zip
rm -r multiqc_data
