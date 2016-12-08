#!/bin/bash

display_usage() { 
	echo "This script performs quality trimming of nextera paired-end data using trim_galore with the following 
	parameters: Quality=30, Length=80, clip_R1=20 clip_R2=20. It takes 3 arguments: fastq files R1/R2 and path 
	of output folder. Please use absolute paths" 
	echo -e "\nUsage:\n$0 [arguments] \n" 
	} 
R1=$1
R2=$2
OUT=$3

if [ $# -lt 3 ]; then
	echo "Not enough arguments"
	echo -e "\n"
	display_usage
	exit 1
elif [ $# -gt 3 ]; then
	echo "Too much arguments"
	echo -e "\n"
	display_usage
	exit 1
fi

if [ "${R1:0:1}" == "/" ]; then
	echo "$R1 is absolute"
else
	echo "$R1 is relative, please use an absolute path to the reference"
	exit 1
fi

if [ "${R2:0:1}" == "/" ]; then
	echo "$R2 is absolute"
else
	echo "$R2 is relative, please use an absolute path to the reference"
	exit 1
fi

if [ "${R1:0:1}" == "/" ]; then
	echo "$OUT is absolute"
else
	echo "$OUT is relative, please use an absolute path to the reference"
	exit 1
fi

mkdir $OUT

PATH=$PATH:/opt/cutadapt/bin/
PATH=$PATH:/opt/
trim_galore --nextera --quality 30 --paired --clip_R1 20 --clip_R2 20 --output_dir $OUT $R1 $R2
