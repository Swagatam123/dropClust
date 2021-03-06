% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/integration.R
\name{Correction}
\alias{Correction}
\title{Correct for batch effects}
\usage{
Correction(object, method = "default", close_th = 0.1,
  cells_th = 0.1, components = 2, ...)
}
\arguments{
\item{object}{A list of SingleCellExperiment objects, each representing a  SingleCellExperiment object from a single batch.}

\item{method}{character, one of c("default","fastmnn").
\code{default} mode performs the dropClust based correction followed by UMAP embedding.
The \code{fastmnn} option performs the mutual neighbourhood based correction which is implemented in the \code{batchelor} package.
when \code{FALSE} the batches are merged on the set of common genes across batches.}

\item{close_th}{for the method = default, specifies the value at which the
expression values of two genes will be considered as close pairs.}

\item{cells_th}{for the method default, specifies the value to
determine what proportion of total number of cells have close pairs.}

\item{components}{number of reduced dimensions to return.}

\item{...}{\code{umap} arguments may be passed.}
}
\value{
A SingleCellExperiment object with two new entry under the
\code{reducedDim()} container to store the reduced dimension components
with the name \code{"CComponents"} and the rank expression matrix named \code{"RankMat"}.
}
\description{
Correct the merged count data based on rank values to obtain a set of reduced and corrected dimensions.
}
\details{
Concatenate the expression counts of all cells from different batches into one expression count object.
The merging is done on the set of union of DE genes obtained from the clustering of each batch.
}
\examples{
\dontrun{
library(SingleCellExperiment)
ncells <- 100
ngenes <- 1200
lambda <-abs(rnorm(ngenes))
counts.1 <- matrix(rpois(ncells*ngenes, lambda =  lambda), ncol=ncells, nrow=ngenes, byrow=TRUE)
rownames(counts.1) <- paste0("Gene", seq_len(ngenes))
colnames(counts.1) <- paste0("Cell", seq_len(ncells))
sce.1 <- SingleCellExperiment(assays = list(counts = counts.1))
rowData(sce.1)$Symbol <- paste0("Gene", seq_len(ngenes))

lambda <-abs(rnorm(ngenes))
counts.2 <- matrix(rpois(ncells*ngenes, lambda =  lambda), ncol=ncells, nrow=ngenes, byrow=TRUE)
rownames(counts.2) <- paste0("Gene", seq_len(ngenes))
colnames(counts.2) <- paste0("Cell", seq_len(ncells))
sce.2 <- SingleCellExperiment(assays = list(counts = counts.2))
rowData(sce.2)$Symbol <- paste0("Gene", seq_len(ngenes))

mixed_sce <- Merge(list(sce.1, sce.2), use.de.genes =TRUE)
mixed_sce <- Correction(mixed_sce, close_th=0.1, cells_th=0.2)
}
}
