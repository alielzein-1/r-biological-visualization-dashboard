# Project 2 Biological Visualization ----
# Author: Ali Al-Reda El-Zein ----
# Description: Visualization of biological measurements ----


# 1. Load required packages ----
library(tidyverse)
library(palmerpenguins)

# 2. Coverting to CSV 
penguin_data <- write_csv(penguins, "../data/penguins.csv")

# 3. Inspecting dataset 
head(penguin_data)
glimpse(penguin_data)
dim(penguin_data)

# 4. Checking for missing values 
missing_values <- penguin_data |> 
  summarise(across(everything(), ~sum(is.na(.)))) |> 
  print()

# 5. Checking for duplicates
duplicates <- penguin_data |>
  duplicated() |> 
  sum() |> 
  print()

# 6. Calculating summary statistics 
species_summary <- penguin_data |> 
  group_by(species) |> 
  summarise(
    average_body_mass = mean(body_mass_g, na.rm = T),
    average_flipper_length = mean(flipper_length_mm, na.rm = T),
    average_bill_length = mean(bill_length_mm, na.rm = T),
    average_bill_depth = mean(bill_depth_mm, na.rm = T),
    sample_count = n(),
    .groups = "drop"
    
  )

species_summary

# 7. Creating bar chart
body_mass_plot <- ggplot(
  species_summary,
  aes(x = species, y =average_body_mass, fill = species)
) + 
  geom_col() +
  labs(
    title = "Average Body Mass Across Penguin Species",
    x = "Penguin Species",
    y = "Average Body Mass (g)",
    fill = "Species"
  ) +
  theme_minimal()

print(body_mass_plot)

# 8. Creating histogram ----
flipper_histogram <- ggplot(
  penguin_data,
  aes(x = flipper_length_mm)
) +
  geom_histogram(
    binwidth = 5,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Penguin Flipper Lengths",
    x = "Flipper Length (mm)",
    y = "Number of Penguins"
  ) +
  theme_minimal()

print(flipper_histogram)

# 9. Creating scatter plot ----
flipper_mass_plot <- ggplot(
  penguin_data,
  aes(
    x= flipper_length_mm,
    y = body_mass_g,
    color = species
    )
) +
  geom_point(size = 2.5) +
  labs(
    title = "Relationship Between Flipper Length and Body Mass",
    x = "Flipper Length (mm)",
    y = "Body Mass (g)",
    color = "Penguin Species"
  ) +
  theme_minimal()

print(flipper_mass_plot)

# 10. Customize visualizations ---- 

# Customizing Bar Chart

body_mass_plot <-  body_mass_plot +
  scale_fill_brewer(palette = "Set2") +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.title = element_text(size = 11),
    legend.position = "none"
  )

# Customizing Histogram
flipper_histogram <- flipper_histogram +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.title = element_text(size = 11)
  )

# Customize Scatter Plot 
flipper_mass_plot <- flipper_mass_plot +
  scale_color_brewer(palette = "Set2") +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    axis.title = element_text(size = 11),
    legend.position = "right"
  )

# 11. Review visualizations ----

# Display bar chart 
print(body_mass_plot)

# Display histogram 
print(flipper_histogram)

# Display scatter plot 
print(flipper_mass_plot)

# 12. Export results ----

# Export summary statistics 
write_csv(species_summary, "../results/species_summary.csv")

# Export bar chart
ggsave(
  "../results/average_body_mass.png", 
  plot = body_mass_plot, 
  width = 8, 
  height = 6, 
  dpi = 300
  )

# Export histogram
ggsave(
  "../results/flipper_length_distribution.png", 
  plot = flipper_histogram, 
  width = 8, 
  height = 6, 
  dpi = 300
)

# Export scatter plot 
ggsave(
  "../results/length_vs_mass.png", 
  plot = flipper_mass_plot, 
  width = 8, 
  height = 6, 
  dpi = 300
)
