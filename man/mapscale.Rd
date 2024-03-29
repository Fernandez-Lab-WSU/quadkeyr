% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map_functions.R
\name{mapscale}
\alias{mapscale}
\title{Map scale (1 : N)}
\usage{
mapscale(latitude, zoom, screen_dpi)
}
\arguments{
\item{latitude}{Latitude (in degrees) at which to measure the map scale.}

\item{zoom}{Zoom or level of detail,
from 1 (lowest detail) to 23 (highest detail).}

\item{screen_dpi}{Resolution of the screen, in dots per inch.}
}
\value{
The map scale, expressed as the denominator N of the ratio 1 : N.
}
\description{
Determines the map scale at a specified latitude,
zoom level, and screen resolution.
For further information, refer to the Microsoft Bing Maps Tile System
documentation.
}
\examples{

mapscale(
  latitude = 0,
  zoom = 6,
  screen_dpi = 96
)


}
\references{
\url{https://learn.microsoft.com/en-us/bingmaps/articles/bing-maps-tile-system}
}
