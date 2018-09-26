

# Development packages
install.packages("Rcpp", dependencies=TRUE, repos='http://cran.rstudio.com/')

install.packages("knitr", "devtools", "roxygen2", "testthat",
                 "Cairo", "snow", "Rmpi", "formatR", "Rdpack",
                 "DependenciesGraph",
                 dependencies=TRUE, repos='http://cran.rstudio.com/')

# Work packages
package.list <- c("RSQLite",
                  "httr", "jsonlite", # www scrapping
                  "doSNOW", "foreach", # Parallel computing
                  "dplyr", "tidyverse",
                  "readxl", "xts", # Read MS Excel files
                  "stringr",
                  "stringdist",      # fuzzy (approximate) string matching
                  "fuzzyjoin", # Join data frames on inexact matching. Approximate String/coordinates/values/ matching 
                  "lubridate",       # Date formating
                  "scales", "automap", "raster", "lmomRFA",
                  "lmomco",  "gdata", "ncdf4", 
                  "geoR", "gstat", "spatstat", # spatial statistics
                  "rgdal", # GIS
                  "igraph", # graph network analysis
                  "ggplot2", # plotting
                  "copula","copBasic", "TwoCop", # Copula (dependence) theory
                  "RFOC",
                  "circular", "movMF", "VecStatGraphs2D", # directional statistics
                  "distr", "fitdistrplus",
                  "actuar",  "polynom", "splines", "squash",
                  )


for (p in setdiff(package.list, installed.packages()[,"Package"])) {install.packages(p)}

devtools::install_github("mathphysmx/cleanTable")
devtools::install_github("mathphysmx/gmshR")
devtools::install_github("mathphysmx/percolation")
devtools::install_github("mathphysmx/empiricalDistribution")
devtools::install_github("mathphysmx/inverseFunction")
devtools::install_github("mathphysmx/bernstein")

