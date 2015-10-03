# features is a vector of features (OTU names, gene names, etc.)
# counts is a vector of counts for each feature
# samples is the number of samples to rarefy to (must be <= sum(counts) for rarefaction without replacement)
# replacement is whether or not sampling should be done with replacement or without (true/false)
rarefy <- function(features, counts, samples, replacement) {
  # pool has the name of each OTU duplicated as many times as the count of that OTU
  counts.no.prior <- counts
  counts.no.prior[counts.no.prior < 1] <- 0
  pool <- c(1:sum(counts.no.prior))
  index <- 0
  for (i in c(1:length(features))) {
    if(counts.no.prior[i] >= 1) {
      pool[(index+1):(index+counts.no.prior[i])] <- rep(features[i],counts.no.prior[i])
      index <- index + counts.no.prior[i]
    }
  }
  sample.pool <- sample(pool, samples, replace=replacement)
  newcounts <- counts.no.prior
  newcounts[] <- 0
  aggregate.pool <- table(sample.pool)
  newcounts[match(dimnames(aggregate.pool)[[1]],features)] <- aggregate.pool
  return(newcounts)
}
