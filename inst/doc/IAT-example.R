## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(implicitMeasures)

## -----------------------------------------------------------------------------
data("raw_data")
# explore the dataframe
str(raw_data)
# explore the levels of the blockcode variable to identify the IAT blocks
levels(raw_data$blockcode)

## ----eval = T-----------------------------------------------------------------
iat_cleandata <- clean_iat(raw_data, sbj_id = "Participant",
                          block_id = "blockcode",
                          mapA_practice = "practice.iat.Milkbad",
                          mapA_test = "test.iat.Milkbad",
                          mapB_practice = "practice.iat.Milkgood",
                          mapB_test = "test.iat.Milkgood",
                          latency_id = "latency",
                          accuracy_id = "correct",
                          trial_id = "trialcode",
                          trial_eliminate = c("reminder", "reminder1"),
                          demo_id = "blockcode",
                          trial_demo = "demo")

## -----------------------------------------------------------------------------
str(iat_cleandata)

## -----------------------------------------------------------------------------
iat_data <- iat_cleandata[[1]]
head(iat_data)

## -----------------------------------------------------------------------------
dscore <- computeD(iat_data, Dscore = "d3")
str(dscore)

## -----------------------------------------------------------------------------
descript_d(dscore)

## -----------------------------------------------------------------------------
descript_d(dscore, latex = T)

## -----------------------------------------------------------------------------
IATrel(dscore)

## ---- fig.align='center', fig.width=6-----------------------------------------
d_plot(dscore)
# change respondents order, remove x-values
d_plot(dscore, order_sbj = "D-increasing", 
       x_values = FALSE)
# change respondents order, remove x-values, and add decsriptive statistics
d_plot(dscore, order_sbj = "D-decreasing", 
       x_values = FALSE, include_stats = TRUE)

## ---- fig.align='center', fig.width=6-----------------------------------------
d_distr(dscore)
# change the number of bins
d_distr(dscore, n_bin = 120)
# change graph and add descriptive statistics
d_distr(dscore, graph = "density", include_stats = TRUE)
# change graph and add descriptive statistics
d_distr(dscore, graph = "violin", include_stats = TRUE)

## -----------------------------------------------------------------------------
multi_scores <- multi_dscore(iat_data, ds = "error-inflation")

## -----------------------------------------------------------------------------
multi_d <- multi_scores[[1]]
head(multi_d)
str(multi_d)

## ----fig.align='center', fig.width=6------------------------------------------
multi_scores[[2]]

