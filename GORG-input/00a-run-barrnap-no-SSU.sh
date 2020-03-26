#!/bin/bash

mkdir -p found_rRNA_unknowns

while read line; do 

		barrnap --kingdom bacteria --threads 3 --outseq found_rRNA_unknowns/$line.rRNA.fasta fasta/${line}_contigs.fasta 

done < no-SSU-according-to-paper.ids 
