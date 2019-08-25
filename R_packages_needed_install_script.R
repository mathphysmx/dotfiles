

# Development packages
install.packages("Rcpp", dependencies=TRUE, repos='http://cran.rstudio.com/')

install.packages("knitr", "devtools", "roxygen2", "testthat",
                 "Cairo", "snow", "Rmpi", "formatR", "Rdpack",
                 "DependenciesGraph",
                 dependencies=TRUE, repos='http://cran.rstudio.com/')

# Work packages
package.list <- c("RSQLite",
                  "httr", "jsonlite", # www scrapping
                  "doSNOW", "foreach", "foreach", # Parallel computing
                  "dplyr", "tidyverse",
                  "lubridate",       # Date formating
                  "readxl", "xts", # Read MS Excel files
                  "stringr",
                  "compare", # compare 2 data.frame's and other R objects
                  "splitstackshape", # Stratified sampling
                  "reshape2", # table manipulation
                  "stringdist",      # fuzzy (approximate) string matching
                  "fuzzyjoin", # Join data frames on inexact matching. Approximate String/coordinates/values/ matching 
                  "scales", "automap", "raster", "lmomRFA",
                  "lmomco",  "gdata", "ncdf4", 
                  "geoR", "gstat", "spatstat", # spatial statistics
                  "rgdal", "maps", "ggmap", # GIS/ web mapping
                  "geosphere", # Long,Lat distance between 2 geo-locations
                  "igraph", # graph network analysis
                  "ggplot2", # plotting
                  "leaflet", "leaflet.extras", # interactive web maps
                  "geojsonio", # Chlorophlet maps on leaflet
                  "shiny",
                  "copula","copBasic", "TwoCop", # Copula (dependence) theory
                  "RFOC",
                  "circular", "movMF", "VecStatGraphs2D", # directional statistics
                  "distr", "fitdistrplus",
                  "actuar",  "polynom", "splines", "squash",
                  "mlbench",  "gower", "cluster", "corrplot",  # Machine learning
                  "keras" # Neural networks
                  )


for (p in setdiff(package.list, installed.packages()[,"Package"])) {install.packages(p)}

devtools::install_github("mathphysmx/cleanTable")
devtools::install_github("mathphysmx/gmshR")
devtools::install_github("mathphysmx/percolation")
devtools::install_github("mathphysmx/empiricalDistribution")
devtools::install_github("mathphysmx/inverseFunction")
devtools::install_github("mathphysmx/bernstein", build_vignettes = TRUE)

