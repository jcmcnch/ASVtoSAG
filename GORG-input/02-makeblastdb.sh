mkdir -p blastdb
cat SSU_only/* SSU_only_unknowns/* > blastdb/200312_all_SSU.fasta
makeblastdb -dbtype nucl -in blastdb/200312_all_SSU.fasta
