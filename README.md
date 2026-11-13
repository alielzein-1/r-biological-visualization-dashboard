# Project 2: Biological Data Visualization

**Author:** Ali Al-Reda El-Zein

## Overview

This project uses R and the Palmer Penguins dataset to explore biological measurements across three penguin species. The goal is to practice data inspection, summary statistics, and biological data visualization using the `tidyverse` and `ggplot2`.

## Dataset

The project uses the Palmer Penguins dataset, which contains measurements collected from penguins in the Palmer Archipelago, Antarctica.

The dataset includes measurements such as:

- Species
- Island
- Bill length and depth
- Flipper length
- Body mass
- Sex
- Year of observation

**Dataset source:** Horst, A. M., Hill, A. P., & Gorman, K. B. (2020). *palmerpenguins: Palmer Archipelago (Antarctica) penguin data*. https://doi.org/10.5281/zenodo.3960218

## Tools and Packages

- **R** – Data analysis and visualization
- **tidyverse** – Data manipulation and visualization
- **palmerpenguins** – Access to the Palmer Penguins dataset
- **ggplot2** – Creating and customizing visualizations

## Project Workflow

### 1. Dataset Import and Inspection
- Loaded the Palmer Penguins dataset.
- Exported the original dataset to a CSV file.
- Inspected the dataset using `head()`, `glimpse()`, and `dim()`.

### 2. Data Quality Checks
- Identified missing values across dataset variables.
- Checked for duplicate observations.

### 3. Summary Statistics
Calculated average measurements for each penguin species:

- Average body mass
- Average flipper length
- Average bill length
- Average bill depth
- Number of observations per species

### 4. Data Visualization

Created three visualizations to explore biological measurements:

**Bar Chart – Average Body Mass Across Penguin Species**

Compares the average body mass of the three penguin species.

**Histogram – Distribution of Penguin Flipper Lengths**

Displays the distribution of flipper lengths across the dataset.

**Scatterplot – Relationship Between Flipper Length and Body Mass**

Explores the relationship between flipper length and body mass, with penguin species represented by different colours.

### 5. Visualization Customization
- Applied colour palettes using `scale_fill_brewer()` and `scale_color_brewer()`.
- Customized plot titles and axis labels.
- Adjusted legend positioning and plot appearance using `theme()`.

### 6. Exporting Results
Exported the summary statistics and visualizations for future reference.

## Repository Structure

```text
r-biological-visualization-dashboard/
│
├── README.md
├── data/
│   └── penguins.csv
│
├── scripts/
│   └── visualization_dashboard.R
│
└── results/
    ├── species_summary.csv
    ├── average_body_mass.png
    ├── flipper_length_distribution.png
    └── length_vs_mass.png
```

## Skills Demonstrated

- R programming
- Data inspection and quality assessment
- Missing-value and duplicate detection
- Grouped summary statistics
- Data manipulation using `dplyr`
- Data visualization using `ggplot2`
- Exporting datasets and plots

## How to Run

1. Install R and RStudio.
2. Install the required packages:

```r
install.packages("tidyverse")
install.packages("palmerpenguins")
```

3. Clone or download this repository.
4. Open `visualization_dashboard.R` in RStudio.
5. Set the working directory to the `scripts/` folder before running the script, so the relative file paths work as written.

