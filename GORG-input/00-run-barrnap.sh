#!/bin/bash

mkdir -p found_rRNA

for item in SSU-containing-ids/*; do 

	for line in `cat $item`; do

		barrnap --kingdom `basename $item .ids` --threads 3 --outseq found_rRNA/$line.rRNA.fasta fasta/${line}_contigs.fasta 

	done 
done
