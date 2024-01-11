# Load Libraries & Data
library(scda)
library(falcon)

adsl <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adsl")
adae <- scda::synthetic_cdisc_dataset("rcd_2022_10_13", "adae")

# Output Table
risk_diff <- list(arm_x = "B: Placebo", arm_y = "A: Drug X") # optional
make_table_06(adae = adae, alt_counts_df = adsl, risk_diff = risk_diff)

# Install and load the required libraries
# install.packages(c("ggplot2", "dplyr"))
library(ggplot2)
library(dplyr)

# Read the CSV data
ae_data <- adae

# Install and load the required libraries
install.packages(c("ggplot2", "dplyr"))
library(ggplot2)
library(dplyr)



# Separate data for Placebo and Drug
placebo_data <- adae %>% filter(ARMCD == "ARM A")
drug_data <- adae %>% filter(ARMCD == "ARM C")
# Install and load the required libraries


# Count occurrences of each AE for Placebo and Drug
placebo_counts <- table(placebo_data$AEDECOD)
drug_counts <- table(drug_data$AEDECOD)

# Create the plot
ggplot() +
  geom_segment(data = placebo_data, aes(x = 0, xend = as.numeric(AEDECOD), y = AEDECOD, yend = AEDECOD),
               color = "blue", size = 2) +
  geom_point(data = placebo_data, aes(x = as.numeric(AEDECOD), y = AEDECOD), color = "blue", size = 3, shape = 18) +
  geom_text(data = data.frame(AEDECOD = names(placebo_counts), Count = as.numeric(placebo_counts)),
            aes(x = as.numeric(AEDECOD), y = AEDECOD, label = Count),
            hjust = 1.2, vjust = 0.5, color = "blue") +  # Annotate with count

  geom_segment(data = drug_data, aes(x = 0, xend = -as.numeric(AEDECOD), y = AEDECOD, yend = AEDECOD),
               color = "red", size = 2) +
  geom_point(data = drug_data, aes(x = -as.numeric(AEDECOD), y = AEDECOD), color = "red", size = 3, shape = 16) +
  geom_text(data = data.frame(AEDECOD = names(drug_counts), Count = as.numeric(drug_counts)),
            aes(x = -as.numeric(AEDECOD), y = AEDECOD, label = Count),
            hjust = -0.2, vjust = 0.5, color = "red") +  # Annotate with count
  labs(title = "Adverse Events Comparison between Placebo and Drug",
       x = "Count",
       y = "Adverse Event") +
  scale_x_continuous(limits = c(-30, 30)) +  # Adjust the range based on your data
  theme_minimal()
