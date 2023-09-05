synthesize_s1 <- function(n_spec = 1000,
                          seed = 1,
                          wn_min = 0, step = 2, lenght = 300,
                          peaks_min = 3, peaks_max = 15){
  #this function automatize the synthesize process for the step 1 rules

  set.seed(seed)

  #Spectra x space
  x_spec <- seq(wn_min,wn_min+lenght,step)

  # #the peaks number
  # peaks <- round(runif(1,peaks_min,peaks_max),0)

  sys_list <- list()

  for(i in 1:n_spec){



    sys_list[[i]]

  }

  names(sys_list) <- paste("sys",1:n_spec,sep = "_")


}
