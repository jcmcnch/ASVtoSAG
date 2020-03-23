#!/bin/bash

mkdir -p SSU_only

for item in `ls found_rRNA/*fasta`; do

	outfile=`basename $item .fasta`.SSU.fasta

	awk 'BEGIN {RS=">"} /16S_rRNA|18S_rRNA/ {print ">"$0}' $item | grep "\S" > SSU_only/$outfile

done
