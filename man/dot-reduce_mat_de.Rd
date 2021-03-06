% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/de_genes.R
\name{.reduce_mat_de}
\alias{.reduce_mat_de}
\title{Reduce large matrix for DE analysis}
\usage{
.reduce_mat_de(norm.mat, clust.list, sample_length = 100)
}
\arguments{
\item{norm.mat}{numeric (or character) vector having length same as the number of rows in the normalized matrix.}

\item{clust.list}{list object as returned by \code{cluster.cells} module.}

\item{sample_length}{integer to specify a maximum length of samples from each cluster.}
}
\value{
integer vector of row  identifiers
}
\description{
Construct submatrix by sampling from each cluster
}
