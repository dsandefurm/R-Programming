#Dorothy Sandefur
#R Programming

#'pollutantmean' calculates the mean of a pollutant (sulfate or nitrate) across 
#a specified list of monitors. The function 'pollutantmean' takes three arguments: 
#'directory', 'pollutant', and 'id'. 
#Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' 
#particulate matter data from the directory specified in the 'directory' 
#argument and returns the mean of the pollutant across all of the monitors, 
#ignoring any missing values coded as NA. 

##Set working directory
setwd("C:/Users/Sandefur/Desktop/COURSERA/R Specialization")
##Create directory 'specdata'
dir.create("specdata")
##Confirm working directory
getwd()

pollutantmean <- function(directory, pollutant = "sulfate", id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  names <- list.files(directory)[id]    ##stores the names of the csv files
  read <- lapply(paste(directory,"/",names, sep = ""),read.csv)     #reads the csv files
  result(mean(unlist(lapply(read, function(x){x[,pollutant]})), na.rm=T)) #calculates the pollutants' mean
  return(round(result, 3)) #rounds the answer to 3 decimal points
  
}

# script tests
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281

