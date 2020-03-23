#!/bin/bash

for genome in 00-SAR86-SAGs/*fasta; do
	
	name=`basename $genome | cut -d\_ -f1`

	prokka  --outdir 00-SAR86-SAGs/prokka/$name \
		--prefix "GORG-SAG.${name}" \
		--genus 'SAR86' \
		--kingdom 'Bacteria' \
  		--metagenome --cpus 3 \
		$genome

done
