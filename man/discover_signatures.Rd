% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/discovery_prediction.R
\name{discover_signatures}
\alias{discover_signatures}
\title{Discover mutational signatures}
\usage{
discover_signatures(
  musica,
  table_name,
  num_signatures,
  algorithm = "lda",
  seed = 1,
  nstart = 10,
  par_cores = 1
)
}
\arguments{
\item{musica}{A \code{\linkS4class{musica}} object.}

\item{table_name}{Name of the table to use for signature discovery. Needs
to be the same name supplied to the table building functions such as
\link{build_standard_table}.}

\item{num_signatures}{Number of signatures to discover.}

\item{algorithm}{Method to use for mutational signature discovery. One of 
\code{"lda"} or \code{"nmf"}. Default \code{"lda"}.}

\item{seed}{Seed to be used for the random number generators in the
signature discovery algorithms. Default \code{1}.}

\item{nstart}{Number of independent random starts used in the mutational
signature algorithms. Default \code{10}.}

\item{par_cores}{Number of parallel cores to use. Only used if
\code{method = "nmf"}. Default \code{1}.}
}
\value{
Returns a A \code{\linkS4class{musica_result}} object containing
signatures and exposures.
}
\description{
Mutational signatures and exposures will be discovered using
methods such as Latent Dirichlet Allocation (lda) or Non-Negative 
Matrix Factorization (nmf). These algorithms will deconvolute a matrix of
counts for mutation types in each sample to two matrices: 1) a "signature"
matrix containing the probability of each mutation type in each sample and
2) an "exposure" matrix containing the estimated counts for each signature
in each sample. Before mutational discovery can be performed,
variants from samples first need to be stored in a 
\code{\linkS4class{musica}} object using the \link{create_musica} function 
and mutation count tables need to be created using functions such as
\link{build_standard_table}.
}
\examples{
data(musica)
g <- select_genome("19")
build_standard_table(musica, g, "SBS96", overwrite = TRUE)
discover_signatures(musica = musica, table_name = "SBS96",
num_signatures = 3, algorithm = "lda", seed = 12345, nstart = 1)
}
