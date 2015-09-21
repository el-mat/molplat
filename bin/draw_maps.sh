#!/bin/bash 

# this is a simple pipeline that maps contig reads against a reference
# genome

# Here we define where to find the fasta file containing contig sequences
# obtained after an assembly and the reference genome
DATA=/data/PacBio_data/C07_12500/C07.fasta
REF=/data/PacBio_data/C07_12500/rev-Becker.fasta

# Adapt output name
OUT=C07
OUTPUT=filtered.fasta

# Run python script to filter out contigs that are too small
LAUNCH=/data/PacBio_data/C07_12500/
cd $LAUNCH

# checks if output file already exists
if [ ! -e $OUTPUT ]; then
	echo "Please enter minimum sequence length: "
	read input_variable
	echo "You entered: $input_variable"
	MINLENGTH=$input_variable
	echo "Please enter maximum sequence length: "
	read input_variable
	echo "You entered: $input_variable"
	MAXLENGTH=$input_variable

	echo "running fasta_filter.py"

	python /opt/fasta_filter.py $DATA $MINLENGTH $MAXLENGTH $OUTPUT
else
        echo "$OUTPUT already exists, please remove file before launching command again: rm $LAUNCH$OUTPUT"
        exit 1;
fi

# Gives the number of sequences before and after filtering
grep -c "^>" $DATA $OUTPUT

# Maps filtered contigs against the reference
nucmer -maxmatch -c 100 -p nucmer $REF $OUTPUT
show-coords -r -c -l nucmer.delta > nucmer.coords
mapview -n 1 -f pdf -p $OUT_$MINLENGTH nucmer.coords
show-snps -C nucmer.delta > $OUT_$MINLENGTH.snps
show-snps nucmer.delta > nucmer.snps
