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

# explore the levels of the blockcode variable to identify the SC-IAT blocks
levels(raw_data$blockcode)

## -----------------------------------------------------------------------------
data("raw_data")
sciat_data <- clean_sciat(raw_data, sbj_id = "Participant",
                         block_id = "blockcode",
                         latency_id = "latency",
                         accuracy_id = "correct",
                         block_sciat_1 = c("test.sc_dark.Darkbad",
                                           "test.sc_dark.Darkgood"),
                         block_sciat_2 = c("test.sc_milk.Milkbad",
                                           "test.sc_milk.Milkgood"),
                         trial_id  = "trialcode",
                         trial_eliminate = c("reminder",
                                             "reminder1"), 
                         demo_id = "blockcode", 
                         trial_demo = "demo")

## -----------------------------------------------------------------------------
str(sciat_data) # structure of the resulting List

## -----------------------------------------------------------------------------
sciat1 <- sciat_data[[1]] # extract first SC-IAT data
sciat2 <- sciat_data[[2]] # extract second SC-IAT data
demo_data <- sciat_data[[3]] # extract demographic information

head(sciat1)
head(demo_data)

## -----------------------------------------------------------------------------
# Compute the D for the first SC-IAT
 d_sciat1 <- Dsciat(sciat1,
                  mappingA = "test.sc_dark.Darkbad",
                  mappingB = "test.sc_dark.Darkgood",
                  non_response = "alert")

# dataframe containing the SC-IAT D of the of the first SC-IAT
str(d_sciat1) 
 
# Compute D for the second SC-IAT
 d_sciat2 <- Dsciat(sciat2,
                  mappingA = "test.sc_milk.Milkbad",
                  mappingB = "test.sc_milk.Milkgood",
                  non_response = "alert")
 
 # dataframe containing the SC-IAT D of the of the second SC-IAT
 head(d_sciat2)


## -----------------------------------------------------------------------------
descript_d(d_sciat1)

## -----------------------------------------------------------------------------
descript_d(d_sciat2, latex = TRUE)

## ----fig.align='center', fig.width=6------------------------------------------
 d_plot(d_sciat1)
# change respondents order, remove x-values
d_plot(d_sciat1, order_sbj = "D-increasing", 
       x_values = FALSE)
# change respondents order, remove x-values, add descriptive statistics
d_plot(d_sciat1, order_sbj = "D-increasing", 
       x_values = FALSE, include_stats = TRUE)

## ----fig.align='center', fig.width=6------------------------------------------
d_distr(d_sciat1)
# change the number of bins
d_distr(d_sciat1, n_bin = 120)
# change graph and add descriptive statistics
d_distr(d_sciat1, graph = "density", include_stats = TRUE)
#change graph and add descriptive statistics
d_distr(d_sciat1, graph = "violin", include_stats = TRUE)

## ----fig.align='center', fig.width=6------------------------------------------
multi_dsciat(d_sciat1, d_sciat2)
# remove mean adn change color
multi_dsciat(d_sciat1, d_sciat2, dens_mean = FALSE, 
       gcolors = "pinks")
# change graph
multi_dsciat(d_sciat1, d_sciat2, graph = "violin")
# change graph and labels for the two SC-IATs, remove x-values
multi_dsciat(d_sciat1, d_sciat2, graph = "point", 
       x_values = FALSE, gcolors = "greens",
       label_sc1 = "Dark SC-IAT", 
       label_sc2 = "Milk SC-IAT")

