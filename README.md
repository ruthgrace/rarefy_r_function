# rarefy_r_function
Simple rarefaction function in R, with or without replacement

The function is run like

```R
rarefied.counts <- rarefy(features, counts, samples, replacement)
```
where

* features is a vector of features (OTU names, gene names, etc.)
* counts is a vector of counts for each feature (must be in the same order as features)
* samples is the number of samples to rarefy to (must be <= sum(counts) for rarefaction without replacement)
* replacement is whether or not sampling should be done with replacement or without (true/false)

The output is a vector of counts where each count corresponds with the features.

If you have applied a prior between 0 and 1 (not inclusive), this function treats those counts as zero.
