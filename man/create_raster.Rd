% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_raster.R
\name{create_raster}
\alias{create_raster}
\title{Create a stars raster}
\usage{
create_raster(template, nx, ny, data, var)
}
\arguments{
\item{template}{A spatial dataset (sf) with the polygon grid used as template}

\item{nx}{Integer; number of cells in x direction.}

\item{ny}{Integer; number of cells in y direction.}

\item{data}{A spatial dataframe (sf) with the variable we want to represent
in the raster.}

\item{var}{The column name of the variable to plot.}
}
\value{
A stars object
}
\description{
The use of a template enables the creation of an accurate
raster, even in the presence of NAs.
}
\examples{

 grid = create_qk_grid(
                     xmin = -59,
                     xmax = -57,
                     ymin = -35,
                     ymax = -34,
                     level = 12)

 grid_coords <- extract_qk_coord(data = grid$data)

 polygrid <- grid_to_polygon(grid_coords)

 data('data_provided')

 data_raster <-  polygrid |>
                   dplyr::inner_join(data_provided,
                    by = c('quadkey' ))

 raster <-  create_raster(template = data_raster,
                         nx = grid$num_cols + 1,
                         ny = grid$num_rows + 1,
                         data = data_raster,
                         var = 'variable')


}
\seealso{
\code{\link{st_as_stars}}, \code{\link{st_rasterize}}
}
