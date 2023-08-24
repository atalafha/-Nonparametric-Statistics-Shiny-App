# Nonparametric Statistics Shiny App

This Shiny app provides an interface to perform nonparametric statistical tests. Users can either upload a CSV file or select a built-in dataset to perform the analysis.

## Features

- **Data Input Options**: Users can either:
  - Upload their own CSV file.
  - Use a built-in dataset (e.g., `cars` dataset).

- **Supported Nonparametric Tests**:
  - Wilcoxon Signed-Rank Test
  - Wilcoxon Rank-Sum Test
  - Kruskal-Wallis Test
  - Other tests can easily be added.

## Usage

1. **Data Input**: 
   - To upload a CSV file, click on the `Browse` button and select your dataset.
   - Alternatively, use the dropdown to select one of the provided datasets.

2. **Select a Nonparametric Test**:
   - Choose the desired test from the dropdown menu.

3. **Variable Selection**:
   - Depending on the chosen test, select the required variables from your dataset using the dropdown menus.

4. **Execute and View Results**:
   - Once the test and variables are selected, click on the `Run Analysis` button.
   - The results will be displayed in the main panel.

## Customizing and Extending the App

- **Adding More Built-in Datasets**: 
  - Extend the list of datasets in the `ui` function.

- **Adding Additional Tests**: 
  - Extend the `available_tests` list and include the corresponding UI and server logic.

## Dependencies

Ensure you have the following R packages installed:

```R
install.packages(c("shiny", "shinydashboard"))
```

## Running the App Locally
To run the app on your local machine:

- Clone/download the repository containing the app code.
- Set your working directory in R to the folder containing the app files.
- Run the app using the command: shiny::runApp()

##  References

 - Hollander, M., Wolfe, D. A., & Chicken, E. (2013). *Nonparametric statistical methods*. John Wiley & Sons.
  - Gibbons, J. D., & Chakraborti, S. (2011). *Nonparametric statistical inference*. CRC Press.





