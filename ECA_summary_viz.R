rm(list = ls())

#install.packages("RMySQL")
library(RMySQL)
library(tidyverse)

# Establish a connect to MySQL
con = dbConnect (MySQL(), dbname = "anl503_eca", username="root", password="mango4673")
query <- "SELECT * FROM eca_summary"  
df <- dbGetQuery(con, query)
head(df)
# Close the database connection
dbDisconnect(con)

# Reshape data from wide to long format
df_long <- df %>% pivot_longer(cols = -mth, names_to = "variable", values_to = "value")
#Plot the visualization
p <- ggplot(df_long, aes(x = mth, y = value)) +
  geom_line(linewidth = 1.0, color = "blue") +  # Single color for simplicity
  facet_wrap(~ variable, scales = "free_y", ncol = 2) +  # Separate panels, free y-scales, arrange facet in 2 columns layout
  scale_x_continuous(breaks = 1:12, labels = 1:12) +  
  labs(
    title = "Monthly ECA Summary Metrics (2024)",
    x = "Month",
    y = "Value"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16),  # Centered title
    strip.text = element_text(size = 12, face = "bold"), # Facet labels
    panel.grid.minor = element_blank(),                 # Remove minor grid lines
    panel.spacing = unit(1, "lines")                    # Space between facets
  )
print(p)
