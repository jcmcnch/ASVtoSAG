# Context

ASVs give us high-resolution distributions across space and time, but don't have good genomic context which could inform physiological inferences. But, now we have a lot of SAGs which could help with this. Analyzing them and correlating with 16S is more straightforward than for MAGs.

So, as a test case, I took some SAR86 ASVs from one station on the GA03 cruise:

![SAR86 ASV depth distributions at stn3 GA03 cruise track, GEOTRACES](https://github.com/jcmcnch/ASVtoSAG/blob/master/SAR86.svg)

Goal: take these ASVs and find SAGs with 16S perfectly matching, then investigate the very general properties of their genomes to see if we can find information compatible with model approximations.

# General workflow:

1. First predict rRNA from SAGs (see subfolder GORG-input for how this is done) and make a blastdb with these rRNA.
2. For a subset of ASVs that have an interesting distribution (perhaps over depth or space), blast requiring perfect matches to the full ASV sequence.
3. From matches, retrieve names of  relevant assemblies (i.e. `cut -f2 SAR86.blastout.tsv | cut -d\: -f3 | cut -d\_ -f1 > SAR86.SAG-targets.ids`, then just copy to a new folder)
4. Run growthpred on these with Shengwei's docker image, parse plaintext to tsv.
5. Add contextual data from GORG study and our ASV depth distributions.

# Results:

* So far, no deep ecotype matches for the GORG SAGs, but all surface SAGs have perfect matches. This is likely to do with sampling biases.
* ASV-specific groups of genomes seem to share mostly the same GC content, suggesting ecological coherence.
* Predicted growth rates are similar, except for one ASV genome group which has a faster growth rate and smaller genome size. Perhaps this suggests the physiologies of the organisms represented by these ASVs are very similar.
