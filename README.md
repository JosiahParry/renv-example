# renv example

This repository was prepared for the VA Dept. Environmental Quality.

This contains an R project, an R script, and an `renv.lock` file. 

The R script runs effectively only with the presence of `dplyr v0.8.0`. The function `group_map()` was not available prior to that, and it was changed in `v0.8.1`. 

If you run the script you will likely run into an error. You can recreate the environment that this script was created in by restoring it with `renv`.

If you run `renv::restore()` this will identify which packages are missing or have different package versions. If you run this it will install the package in your default package library. If you would like to have it in a project level directory run `renv::init()`.

For a review of `renv` visit https://rstudio.github.io/renv/articles/renv.html.

## Recreate the visualization

From your IDE create a new project from Git or version control. Provide the value `https://github.com/JosiahParry/renv-example.git` 
