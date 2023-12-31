% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_and_format_files.R
\name{read_all_files}
\alias{read_all_files}
\title{Read all the .csv files in a folder and format the data.}
\usage{
read_all_files(path_to_csvs, colnames, coltypes)
}
\arguments{
\item{path_to_csvs}{Path to the folder where the .csv files are stored}

\item{colnames}{Columns to include in the results (as character).
For more information go to readr::read_csv()}

\item{coltypes}{Column specifications (as character).
See vignette("readr") for more details.
documentation.}
}
\value{
A dataframe with the information of all the files.
}
\description{
This function reads all the .csv files in a particular folder.
These files consistently contain identical columns, with variations
only in location, day, and time. As a result, we can uniformly apply
specific formatting to columns across these files."
}
\examples{


# read_all_files(path_to_csvs = 'data/',
#                 colnames = c("lat", "lon", 
#                              "quadkey", "date_time", 
#                              "n_crisis", "percent_change"),
#                 coltypes = list(
 #                                lat = 'd',
 #                                lon = 'd',
 #                                quadkey = 'd',
 #                                date_time = 'T',
 #                               n_crisis = 'c',
 #                                percent_change = 'c'))

}
\seealso{
\code{\link{format_data}}

\code{\link[readr]{read_csv}}
}
