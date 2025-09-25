# Load packages
library(dplyr)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)

data <- read.csv("data/cleaned_data.csv", , stringsAsFactors = FALSE)

summary(data[, c("Goals", "Short_Passes")])

data %>%
  group_by(Season) %>%
  summarise(
    avg_goals = mean(Goals, na.rm = TRUE),
    avg_short_passes = mean(Short_Passes, na.rm = TRUE)
  )

ggplot(data, aes(x = Short_Passes, y = Goals, label = Team)) +
  geom_point(color = Season, size = 3) +  # scatter points
  geom_smooth(method = "lm", se = FALSE, lwd = 1.2, color = "red") + 
  geom_text_repel(size = 3, color = "darkgrey") +  # Labels in one color
  scale_color_brewer(palette = "Set1") +
  labs(
    x = "Total Number of Successful Passes",
    y = "Total Goals",
    title = "Regression of Team Goals on Passes",
    color = "Season"
  ) +
  theme_minimal(base_size = 14)


ggplot(data, aes(x = Goals)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "white", alpha = 0.7) +
  labs(title = "Distribution of Goals", x = "Goals", y = "Count")

ggplot(data, aes(x = Short_Passes)) +
  geom_histogram(binwidth = 200, fill = "green", color = "white", alpha = 0.7) +
  labs(title = "Distribution of Short Passes", x = "Short Passes", y = "Count")


# 4. Boxplots by season
ggplot(data, aes(x = factor(Season), y = Goals)) +
  geom_boxplot(fill = "orange", alpha = 0.7) +
  labs(title = "Goals Distribution by Season", x = "Season", y = "Goals")

ggplot(data, aes(x = factor(Season), y = Short_Passes)) +
  geom_boxplot(fill = "purple", alpha = 0.7) +
  labs(title = "Short Passes Distribution by Season", x = "Season", y = "Short Passes")

# 5. Correlation
cor(data$Short_Passes, data$Goals, use = "complete.obs")
