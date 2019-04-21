
## http://www.onthelambda.com/2014/09/17/fun-with-rprofile-and-customizing-r-startup/
## Example of .Rprofile
.First <- function(){
  
  # library(tidyverse) # includes several
  library(readxl)
  library(stringr)
  library(stringi)
  
  # plotting
  library(ggplot2)
  library(ggmap)
  library(usmap)
  library(maps)
  source("https://raw.githubusercontent.com/tidyverse/ggplot2/master/R/stat-qq-line.R") # for ggplot2 Q-Q plot line
  # library(plotly) # conflicting errors
  
  library(dplyr) # data manipulation
  library(lubridate) # for correct formating of dates
  library(reshape2)
  library(splitstackshape) # Stratified sampling
  
  library(fitdistrplus)  # fit distributions
  library(corrplot) # correlation matrix plot
  library(stringdist) # approximate string matching and fuzzy search
  library(cluster) 
  library(gower)# for gower distance
  
  library(geosphere) # Long,Lat distance between 2 geo-locations
  library(leaflet)
  library(leaflet.extras)
  library(shiny)
  
  
  # parallel computing
  library(doSNOW)
  library(foreach)
  library(parallel)
  
  # neural networks
  library(keras)
  library(mlbench) 
  library(magrittr)
  library(neuralnet)
  
  # Custom packages
  library(virtualAssetR)
  library(cleanTable)
  
  cat("\014") # cleans the console
  
  
  okStartUp = sprintf("\n VIRTUAL_ASSET's required packages and functions for project in %s loaded properly. See hidden .Rprofile file to enable more local startup packages and or functions.\n\n", getwd())
  cat(okStartUp)
}
