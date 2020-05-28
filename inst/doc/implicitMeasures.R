## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>", 
  fig.path = "",
  warning = FALSE, 
  message = FALSE
)

## ----setup, echo = FALSE------------------------------------------------------
library(implicitMeasures)

## ---- echo = FALSE------------------------------------------------------------
library(tableHTML)
library(data.table)
iat <- data.table(Block = paste0("B",1:7), Function = c(rep("Practice", 2), "Associative Practice Mapping A", "Associative Test Mapping A", "Practice", "Associative Practice Mapping B", "Associative Test Mapping B"), "Left response key" = c("Object 1", "Positive", "Object 1 + Positive", "Object 1 + Positive",  "Object 2", "Object 2 + Positive", "Object 2 + Positive"), "Right response key" = c("Object 2", "Negative", "Object 2 + Negative", "Object 2 + Negative", "Object 1", "Object 1 + Negative", "Object 1 + Negative") )

tableHTML(iat, rownames = FALSE, widths = c(20, c(rep(310, 3))), 
          caption = "Table 1: IAT structure.") %>%
  add_theme(theme = "scientific") %>%
  add_css_caption(css = list(c("font-weight", "text-align"), c("bold", "left")))


## ---- echo = FALSE------------------------------------------------------------
data.table(Dscore = paste0(rep("D", 6), 1:6), 
                      "Error treatment" = c(rep("Built-in", 2), "Mean + 2sd", "Mean + 600ms", 
                                            "Mean +2 sd", "Mean + 600ms"), 
                      "Lower tail treatment" = c("No", "< 400ms", "No", "No", "< 400ms", "< 400ms")) %>%
  tableHTML(rownames = F, widths = c(50, 280, 280), caption = "Table 2: D-score algorithm") %>%
  add_theme(theme = "scientific") %>%
  add_css_caption(css = list(c("font-weight", "text-align"), c("bold", "left")))


## ---- echo = F----------------------------------------------------------------
data.table(Block = paste("B",1:4), 
           Function = paste(rep(c("Associative practice", "Associative test"), 2), 
                            rep(c("Mapping A", "Mapping B"), c(2,2))),
           "Left response Key" = c(rep("Object 1 + Positive", 2), rep("Positive", 2)), 
           "Right response Key" = c(rep("Negative", 2), rep("Object 1 + Negative", 2))) %>%
  tableHTML(rownames = F, widths = c(20, 310, 310, 310), caption = "Table 3: SC-IAT structure") %>%
  add_theme(theme = "scientific") %>%
  add_css_caption(css = list(c("font-weight", "text-align"), c("bold", "left")))
  

## -----------------------------------------------------------------------------
# upload the data set
data(raw_data)

# explore the dataset
head(raw_data)

str(raw_data)

