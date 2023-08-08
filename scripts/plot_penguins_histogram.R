# Load libraries ---------
library(ggplot2)
library(palmerpenguins)

output_file <- here::here("plots", "penguin_histogram.png")

# Make histogram of penguin bill depth --------
penguin_histogram <- ggplot(penguins) +
  aes(x = bill_depth_mm) +
  geom_histogram() +
  labs(x = "Penguin bill depth (mm)")

# Export plot
ggsave(filename = output_file,
       plot = penguin_histogram)