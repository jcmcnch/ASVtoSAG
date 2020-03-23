# General workflow:

1. First predict rRNA from SAGs (see subfolder GORG-input for how this is done) and make a blastdb with these rRNA.
2. For a subset of ASVs that have an interesting distribution (perhaps over depth or space), blast requiring perfect matches to the full ASV sequence.
3. From matches, retrieve names of  relevant assemblies (i.e. `cut -f2 SAR86.blastout.tsv | cut -d\: -f3 | cut -d\_ -f1 > SAR86.SAG-targets.ids`, then just copy to a new folder)
4. 
