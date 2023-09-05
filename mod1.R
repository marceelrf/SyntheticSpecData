
# 1st step ----------------------------------------------------------------
# Fix spectra window (x)
# Random peak number - 2 to 15
# Fix wn step 2 cm-1
# Fix length


seed <- 42
wn_min <- 300
wn_max <- 700
#length
step <- 2



set.seed(seed)
x_spec <- seq(wn_min, wn_max,step )
n_peaks <- 15 # runif
x0 <- runif(n_peaks,min = wn_min +1,max =  wn_max -1)
amp <- runif(n_peaks,min = .1, max = 10)
sigma_x <- rnorm(n_peaks,mean = 10,sd = 2)
gamma_x <- rnorm(n_peaks,mean = 10,sd = 2)


params_tab <-
  tibble(x0,amp,sigma_x,gamma_x)



spec_list <- NULL
for (i in 1:nrow(params_tab)) {

  spec_list[[i]] <- amp[i]*voigt(x = x_spec,
                               x0 = params_tab$x0[i],
                               sigma = params_tab$sigma_x[i],
                               gamma = params_tab$gamma_x[i])
}
spec_final <- reduce(spec_list, `+`)

