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
1. First make sure to download the latest version of this repository. [This page](https://www.itprotoday.com/mobile-management-and-security/how-do-i-download-files-github) has instructions on how to download repositories from GitHub. 
2. Once you have downloaded the repository, make any changes locally in RStudio, and click the "Run App" button. This will launch the app on your computer, but will not change the live version of the app.  
3. When the app runs locally in RStudio, there will be an option to publish the app in the top right corner of the window. Click that button, and you will be asked to log in to a shinyapps.io account. After logging in to the account you want to use, you can re-publish the app. This will ensure that your changes are reflected in the live version of the app.  
