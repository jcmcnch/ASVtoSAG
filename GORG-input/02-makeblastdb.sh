mkdir -p blastdb
cat SSU_only/* > blastdb/200312_all_SSU.fasta
makeblastdb -dbtype nucl -in blastdb/200312_all_SSU.fasta
