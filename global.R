
#-------------------------------------------------------------------------------
#
# Nayef Ahmad - Overdose crisis visualization
#
# Global part of the Shiny application
#
# Code style follows 'Google R Style Guide'
# https://google.github.io/styleguide/Rguide.html
#
#-------------------------------------------------------------------------------

library(data.table)

library(shiny)
library(shinycssloaders)
library(shinyWidgets)
library(bs4Dash)
library(leaflet)
library(plotly)
library(DT)
library(sp)

# Reads main data
dt <- readRDS("data/main_data.RData")

# Prepares data extracts
cols <- sort(colnames(dt))
country_regions <- sort(na.omit(unique(dt$country_region)))
years <- range(dt$year_study, na.rm = TRUE)

# Reads map data
world <- readRDS("data/world.RData")
