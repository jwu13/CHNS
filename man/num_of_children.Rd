% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/num_of_children.R
\name{num_of_children}
\alias{num_of_children}
\title{Function for returning the number of children a woman had up to an inputted year.}
\usage{
num_of_children(year)
}
\arguments{
\item{year}{survey year. Find possible base years in the  \code{emw_12} data set.}
}
\value{
A data frame with the number of children a woman had up to an inputted year.
}
\description{
Provides the number of children a woman had up to an inputted year (1989,1991,1993,1997,2000,2004,2006,2009,2011,2015)
}
\examples{
num_of_children(2015)
num_of_children(2006)
}
