% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_and_format_files.R
\name{format_data}
\alias{format_data}
\title{Format the data}
\usage{
format_data(data)
}
\arguments{
\item{data}{A dataframe with a quadkey, date_time, country columns and
other numeric variables}
}
\value{
A dataframe.
}
\description{
This function modifies the format of three columns the provided
data.
}
\examples{

#data(onefile)
#format_data(data = onefile)

}
\seealso{
\code{\link{read_all_files}}
}
