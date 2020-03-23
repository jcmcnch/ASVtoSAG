#!/bin/bash
#parse growthpred plaintext output into tsv using bash skullduggery

printf "SAG_id\tGeneration_time (hours)\t+/-\n" > SAR86.growthpred.results.tsv 

for item in growthpred-output/*results ; do 
	
	SAGname=`basename $item | cut -d. -f2` 
	tsvoutput=`head -n1 $item | grep hours | cut -f2 -d\: | sed 's/ hours +\/- /\t/' | sed 's/ //g'` 
	printf "$SAGname\t$tsvoutput\n"
	
done >> SAR86.growthpred.results.tsv
