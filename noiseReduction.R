library(dbscan)
library(cluster)
library(fpc)

###########################################################################
           # Basic Noise Reduction Function using DBSCAN
###########################################################################


removenoise <- function(newdata) {
#kNNdistplot(new, k=5)
#abline(h=0.25, col="red")

# DBSCAN for detecting noise. Optimal eps and minPts values depends on dataset to dataset and domain knowledge comes handy in here.

db <- dbscan::dbscan(newdata, eps=0.10, minPts=11)
db
clust_result <- db$cluster

# Data points labelled with cluster number 0 denotes Noise
noisydatapoints <- which(clust_result == 0)
noisydatasize <-length(noisydatapoints)
cat("Number of noisy points detected: \n",noisydatasize,"\n\n" )
cat("Data record row ids where noise is detected: \n", noisydatapoints,"\n\n")

# Plotting the data points where black points indicate noise
cat("Plotting the data points...\n\n");
pairs(newdata, col = db$cluster + 1L)
plot(newdata, col = db$cluster + 1L)

return(noisydatapoints)

}


###########################################################################
                          # Main Procedure
###########################################################################


cat("Loading the data file...\n");
datafile <- 'SCONES_test.tsv';

if( ! file.exists(datafile) )
  stop( "Data file ",datafile," does not exist\n");

# Retrieve the desired data from input file
X <- read.table(datafile, header= TRUE)
keepcolumns <- c("testSample1","testSample2")
newdata <- X[keepcolumns]

# The function removenoise() takes the data and returns the noisy data points using DBSCAN
cat("Detecting and Removing noisy data points...\n\n");
noisy <- removenoise(newdata)             
finaldata <- X[-noisy,]
noiselessdata <- nrow(finaldata)
cat("Total records after noise reduction \n", noiselessdata,"\n\n")

# Writing the data after noise reduction to noiseless.tsv file. Here all the noisy points detected are removed
cat("Writing noiseless data to file noiseless.tsv\n\n");
write.table(finaldata, file='noiseless.tsv', quote=FALSE, sep='\t',row.names = FALSE)




