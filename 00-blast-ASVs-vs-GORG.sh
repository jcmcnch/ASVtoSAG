#!/bin/bash

blastn -query GA03-input/GA03-DADA2-minabund0.01-SAR86.fasta -db GORG-input/blastdb/200312_all_SSU.fasta -outfmt 6 -perc_identity 100 -qcov_hsp_perc 100 > results.tsv

cut -f2 results.tsv | cut -d\: -f3 | cut -d\_ -f1 > SAR86.SAG-targets.ids

mkdir -p 00-SAR86-SAGs

for item in `cat SAR86.SAG-targets.ids`; do

	cp GORG-input/fasta/$item*fasta 00-SAR86-SAGs

done
