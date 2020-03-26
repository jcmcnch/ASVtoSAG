#!/bin/bash

mkdir -p SSU_only_unknowns

for item in `ls found_rRNA_unknowns/*fasta`; do

	outfile=`basename $item .fasta`.SSU.fasta

	awk 'BEGIN {RS=">"} /16S_rRNA|18S_rRNA/ {print ">"$0}' $item | grep "\S" > SSU_only_unknowns/$outfile

done

#remove empty files
find ./SSU_only_unknowns -size  0 -print0 | xargs -0 rm --
