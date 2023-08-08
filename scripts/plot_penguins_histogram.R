# Load libraries ---------
library(ggplot2)
library(palmerpenguins)
library(optparse)

# Load input options -------
option_list <- list(
  make_option(
    opt_str = c("--bins"),
    type = "integer",
    default = 20,
    help = "number of bins to use in the histogram"
  )
)
opt <- parse_args(OptionParser(option_list = option_list))
bins <- opt$bins

output_file <- here::here("plots", 
                          glue::glue("penguin_histogram_{bins}_bins.png")
)

# Make histogram of penguin bill depth --------
penguin_histogram <- ggplot(penguins) +
  aes(x = bill_depth_mm) +
  geom_histogram(bins = bins, color = "dodgerblue", fill = "gold") +
  labs(x = "Penguin bill depth (mm)")

# Export plot
ggsave(filename = output_file,
       plot = penguin_histogram)