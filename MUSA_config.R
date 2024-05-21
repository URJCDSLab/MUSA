
#Find your python path with 
####################### CONFIG PYTHON IN R  #####################################
# Follow this steps:
  # 1. Install Reticulate: install.packages('reticulate')
  # 2. Run reticulate::install_python()
  # 3. Copy the python path where it has been installed into the function above 
  # 4. Paste it to reticulate::use_python() as an input to indicate your system where reticulate has been install

##################### MUSA v-env ###########################
# A virtual enviroment containing the dependences of the scraper must be created
# create the enviroment 
reticulate::virtualenv_create("MUSA")

# install dependencies
dependencies <- c("numpy","pandas","requests","ScraperFC")
for (package in dependencies){
  reticulate::virtualenv_install("MUSA", package)
}

