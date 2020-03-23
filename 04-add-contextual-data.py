#!/usr/bin/env python3

import csv
import sys

hashTable2Edit={}
for astrLine in csv.reader(open(sys.argv[1]), csv.excel_tab):
	hashTable2Edit[astrLine[0]] = astrLine[1:]

hashGORGcontextual={}
for astrLine in csv.reader(open(sys.argv[2]), csv.excel_tab):
	hashGORGcontextual[astrLine[0]] = astrLine[1:]

for key, value in hashTable2Edit.items():
	if key in hashGORGcontextual.keys():
		hashTable2Edit[key].append(hashGORGcontextual[key][11])
		hashTable2Edit[key].append(hashGORGcontextual[key][10])
		hashTable2Edit[key].append(hashGORGcontextual[key][9])

hashTable2Edit["SAG_id"] = hashTable2Edit["SAG_id"] + ["Estimated genome size (Mbp)","Genome completeness (%)","GC content (%)","distributional_pattern","ASV perfect hit"]

aDeep = []
for line in open(sys.argv[3]):
	aDeep.append(line.strip())

aSurface = []
for line in open(sys.argv[4]):
	aSurface.append(line.strip())

hashDistributions = {}
for astrLine in csv.reader(open(sys.argv[5]), csv.excel_tab):
	SAGid=astrLine[1].strip()[10:20]
	if astrLine[0] in aDeep:
		hashDistributions[SAGid] = ["deep", astrLine[0]]
	elif astrLine[0] in aSurface:
		hashDistributions[SAGid] = ["surface", astrLine[0]]

for key, value in hashTable2Edit.items():
	if key != "SAG_id":
		hashTable2Edit[key] = hashTable2Edit[key] + hashDistributions[key]

for key, items in hashTable2Edit.items():
	aLine2Print = [key] + items
	print('\t'.join(aLine2Print))
