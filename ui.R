
#-------------------------------------------------------------------------------
#
# Nayef Ahmad - Overdose crisis visualization
#
# UI part of the Shiny application
#
# Code style follows 'Google R Style Guide'
# https://google.github.io/styleguide/Rguide.html
#
#-------------------------------------------------------------------------------

# Dataset Menu
dataset_Ui <- function(id) {
  bs4TabItem(
    tabName = "dataset",
    fluidPage(
      title = "Exploring Dataset",
      
      fluidRow(
        column(
          width = 2,
          
          bs4Card(
            title = "Filters",
            width = 12,
            status = "secondary",
            closable = FALSE,
            collapsible = TRUE,
            maximizable = TRUE,
            
            sliderInput(
              inputId = "years_range",
              label = "Years range:",
              sep = "",
              min = years[1],
              max = years[2],
              step = 1,
              value = years,
              ticks = TRUE,
              width = "100%"
            ),
            
            awesomeCheckboxGroup(
              inputId = "data_options",
              label = NULL,
              choices = c("Show complete rows", "Show rows with NAs"),
              selected = c("Show complete rows"),
              inline = FALSE,
              status = "primary"
            ),
            
            selectizeInput(
              inputId = "input_cols",
              label = "Select columns",
              choices = cols,
              selected = c("record_id", "country_region", "country.factor", "year_study", "policy_type"),
              multiple = TRUE,
              options = NULL),
            
            selectizeInput(
              inputId = "input_country_region",
              label = "Select region",
              choices = country_regions,
              selected = c("5_North America"),
              multiple = TRUE,
              options = NULL),
            
            uiOutput("input_countries")
            
          )
        ),
        
        column(
          width = 10,
          
          bs4Card(
            title = "Select countries", 
            width = 12,
            status = "secondary",
            closable = FALSE,
            collapsible = TRUE,
            maximizable = TRUE,
            leafletOutput("geomap", height = 500)
          ),
          
          bs4Card(
            title = "Explore dataset",
            width = 12,
            status = "secondary",
            closable = FALSE,
            collapsible = TRUE,
            maximizable = TRUE,
            DT::dataTableOutput("dataset")
          )
        )
      )
    )
  )
}

# Highlights Menu
highlights_Ui <- function(id) {
  bs4TabItem(tabName = "highlights",
             fluidRow(title = "Highlights",
                      column(width = 12,
                             bs4Card(
                               title = "Highlights (placeholder)", 
                               status = "secondary",
                               closable = FALSE,
                               collapsible = FALSE,
                               width = 12,
                               plotlyOutput('placeholder_plot')
                             )
                      )
             )
  )
}

# Background Menu
background_Ui <- function(id) {
  bs4TabItem(tabName = "background",
             fluidRow(title = "Background",
                      column(width = 12,
                             bs4Card(
                               title = "Background", 
                               status = "secondary",
                               closable = FALSE,
                               collapsible = FALSE,
                               width = 12,
                               p("The criminalisation of people who use drugs compounds drug-related challenges and worsens health and welfare outcomes. Across the world, there is a growing number of jurisdictions where the possession of scheduled drugs for personal use has been decriminalised. In some countries and federal states, this has been extended to the cultivation of cannabis for personal use or the sharing of substances where there is no financial gain (also known as ‘social sharing’)."),
                               p("In the context of drug policy, ‘decriminalisation’ refers to the removal of criminal penalties for activities related to drug use. In some legal systems criminal penalties are replaced by civil sanctions, while in other systems no penalties are applied – please see our glossary for more detailed definitions."),
                               p("Some form of decriminalisation has been adopted in 30 countries – with significant differences and levels of effectiveness. This interactive map provides an overview of these models, offering insights into decriminalisation laws, their implementation and impact.")
                             )
                      )
             )
  )
}


shinyUI(bs4DashPage(
  
  sidebar_mini = TRUE,
  enable_preloader = TRUE,
  loading_duration = 1,
  title = "Overdose crisis visualization",
  
  navbar = bs4DashNavbar(
    skin = "light",
    compact = FALSE,
    leftUi = h4("Overdose Crisis Visualization", style = "padding: 5px 0;"),
    rightUi = img(src = "logo_long.png", align = "right", height = "40px")
  ),
  
  sidebar = bs4DashSidebar(
    expand_on_hover = FALSE,
    skin = "dark",
    status = "olive",
    title = tags$b("Menu"),
    brandColor = "gray",
    src = "logo.png",
    url = "http://bccdc.ca",
    bs4SidebarMenu(
      id = "sidebar_menu",
      flat = FALSE,
      compact = FALSE,
      child_indent = TRUE,
      bs4SidebarMenuItem("Dataset", tabName = "dataset", icon = "database"),
      bs4SidebarMenuItem("Highlights", tabName = "highlights", icon = "highlighter"),
      bs4SidebarMenuItem("Background", tabName = "background", icon = "file-alt")
    )
  ),
  
  footer = bs4DashFooter(
    p("Copyright © 2020 BC Center for Disease Control")
  ),
  
  body = bs4DashBody(
    includeCSS("www/styles.css"),
    
    bs4TabItems(
      dataset_Ui(id = "dataset"),
      highlights_Ui(id = "highlights"),
      background_Ui(id = "background")
    )
  )
  
))
  
  