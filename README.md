# Overdose crisis data viz - Shiny app 
The app can be viewed [here](https://meenrz.shinyapps.io/overdose-crisis-data-viz_shiny-app/_w_b9597691/_w_425b5793/). 

For background on this project, see [this page](https://github.com/nayefahmad/overdose-crisis-data-viz/blob/master/README.md). As a quick summary, the goal of this project is to develop an interactive online visualization tool to allow users to understand the various legal, health, and social policies internationally that have been taken to address the overdose crisis.

## Repository structure 
These are the main code files: 
1. `data_preprocessing.R`: this file reads in the final output data from [this repo](https://github.com/nayefahmad/overdose-crisis-data-viz/blob/master/README.md), and does some further pre-processing required for the Shiny app. Outputs are saved as .Rds files in the **data** folder. 
    1. This would be the appropriate place to do any last cleaning steps of the data fields (e.g. to remove leading numbers in values such as "2_legislations"). See the section on updating the published version of the app for details on how to make sure these changes are reflected on the live version.  
3. `server.R`, `ui.R`, and `global.R`: standard files used for defining the back-end and front-end of the Shiny app. 
    1. In order to add custom text to the "Background" page of the app, you will have to edit lines 116 to 119 in `ui.R`. See the section on updating the published version of the app for details on how to make sure these changes are reflected on the live version. 
4. **www** folder: this is where images (e.g. logos) used in the app are saved. 


## Updating the published version of the app 
1. First make sure to download the latest version of this repo. Then make any changes locally in RStudio, and click the "Run App" button. When the app runs, in the top right, there will be an option to publish the app. You will have to log in to the shinyapps.io account, and then you can publish the app. 
