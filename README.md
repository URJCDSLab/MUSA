# MUSA Soccer Ratings 

The following repostory contains a Python script to scrape soccer player ratings from Sofascore for a specified league and season.
Such script has been implemented in R using `reticulate`

## List of contents

1. [Requeriments](#requeriments)
2. [Setup Instructions](#setup-instructions)
3. [About us](#about-us)


## Requirements

- Python 3.x
- R with Reticulate package

## Setup Instructions

### Step 1: Clone the Repository

Clone this repository to your local machine:
```sh
git clone https://github.com/AlvaroNovillo/MUSA.git
cd MUSA
```

### Step 1: Install Reticulate in R

1. Install the `reticulate` package in R:
    ```R
    install.packages('reticulate')
    ```

2. Run the following command to install Python:
    ```R
    reticulate::install_python()
    ```

3. Copy the Python path where it has been installed. You can find it by running:
    ```R
    reticulate::py_config()
    ```

4. Use the Python path in the `reticulate::use_python()` function:
    ```R
    reticulate::use_python("<path_to_python>")
    ```

### Step 2: Create a Virtual Environment

1. Create a virtual environment named "MUSA":
    ```R
    reticulate::virtualenv_create("MUSA")
    ```

2. Install the dependencies in the virtual environment:
    ```R
    dependencies <- c("numpy", "pandas", "requests", "ScraperFC")
    for (package in dependencies) {
      reticulate::virtualenv_install("MUSA", package)
    }
    ```
All the code for this steps can be found at `MUSA_config.R`.

### Step 3: Run the code

The source code is located in `MUSA_main.R`
## About us
DSLab URJC. Contact info:

* [alvaro.novillo@urjc.es](https://www.linkedin.com/in/%C3%A1lvaro-novillo-correas-1b4452226)
