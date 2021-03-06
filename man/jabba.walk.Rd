% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/JaBbA.R
\name{jabba.walk}
\alias{jabba.walk}
\title{jabba.walk}
\usage{
jabba.walk(sol, kag = NULL, digested = T, outdir = "temp.walk",
  junction.ix = NULL, loci = NULL, clustersize = 100, trim = FALSE,
  trim.w = 1e+06, prune = FALSE, prune.d1 = 1e+05, prune.d2 = 1e+05,
  maxiterations = Inf, mc.cores = 1,
  genes = read.delim("~/DB/COSMIC/cancer_gene_census.tsv", strings =
  F)$Symbol, verbose = T, max.threads = 4, customparams = T, mem = 6,
  all.paths = FALSE, nomip = F, tilim = 100, nsolutions = 100,
  cb.interval = 10000, cb.chunksize = 10000, cb.maxchunks = 1e+10)
}
\arguments{
\item{sol}{JaBbA object}

\item{outdir}{output directory}

\item{junction.ix}{junction indices around which to build walks (default is all junctions)}

\item{loci}{loci around which to build walks (over-rides junction.ix), alternatively can be a list of  "all.paths" objects (i.e. each a list utput of initial all.paths = TRUE run  +/- field $prior for walk to re-eval a given all.paths combo}

\item{clustersize}{size of the cluster to output around the locus or junction of interest}

\item{trim}{logical flag whether trim in neighborhood of junction (only applicable if loci = NULL, default = TRUE)}

\item{trim.w}{integer width to which to trim to}

\item{prune}{flag whether to prune trivial walks for whom a path can be drawn from first to last interval in a graph linking intervals with pairwise distance < d1 on the walk or distance < d2 on the reference}

\item{prune.d1}{local distance threshold for walk pruning}

\item{prune.d2}{referenc distance threshold for walk pruning}

\item{mc.cores}{number of cores to use, default 1}

\item{genes}{character vector of gene symbols with which to annotate walk (eg cancer genes)}

\item{verbose}{logical flag}
}
\value{
list of walk set around each locus or junction that is inputted to analysis, each list item is a list with the following fields
$win = input locus of interest, $grl = GRangesList of walks, $grs is a collapsed footprint of all walks in the walk list for this locu
$td gTrack of of the output, additional outputs for debugging: $sol, $K, $Bc, $eix, $vix, $h
}
\description{
Computes walks around all aberrant edges in JABbA object
}
\details{
Takes in JaBbA solution and computes local
reconstructions around all aberrant edges (default).  Reconstructions (i.e. Huts) consists
of collections of walks, each walk associated with a copy number, and a given
region (collection of genomic windows).  The interval sum of walks in a given region, weighted
by copy numbers will recapitulate the marginal copy profile (as estimated by JaBbA).
The reconstruction is chosen to maximize parsimony.

Optional flags allow making huts around specific junctions or specified loci (GRangesList)

Walks are reconstructed locally within "clustersize" nodes of each aberrant edge, where
clustersize is measured by the number of total edges.  Larger cluster sizes may fail to be
computationally tractable, i.e. with a highly rearranged genome in an area of dense interconnectivity.
}
