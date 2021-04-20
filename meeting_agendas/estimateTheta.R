## Expect command line args at the end. 
args = commandArgs(trailingOnly = TRUE)
## Extract and cast as numeric from character
tmpM = as.numeric(args[1])
tmpSeed = as.numeric(args[2])

estimateTheta <- function( m = 1000, seed = NULL ) {
    if (!is.null( seed )) { set.seed( seed ) }
    est <- mean ( replicate( n = m, expr = {
        x <- rnorm(2)
        abs(x[1] - x[2])
    } ) )
    return( est )
}
## print
(est <- estimateTheta( m = tmpM, seed = tmpSeed ))
jobID <- paste( tmpM, tmpSeed, sep="_" )
saveRDS( data.frame( m = tmpM, seed = tmpSeed, est = est),
        paste0( "thetaHat_", jobID, ".rds") ) 
