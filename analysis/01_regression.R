# 01_regression.R

library(dplyr)
library(ggplot2)
library(ggrepel)
library(RColorBrewer)


data <- read.csv("data/cleaned_data.csv", , stringsAsFactors = FALSE)

model = lm(Goals ~ Short_Passes, data = data)
summary(model)



ggplot(data, aes(x = Short_Passes, y = Goals, label = Team)) +
  geom_point(aes(color = Season), size = 3) +
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



plot(
  data$Short_Passes, data$Goals, 
  xlab = "Total Number of Successful Passes", 
  ylab = "Total Goals", 
  main = "Regression",
  pch = 16, col = "blue"
)
abline(model, col = "red", lwd = 2)

plot(model$fitted, model$residuals,
     xlab = expression("Fitted Values"~~ hat(Y)),
     ylab = expression("Residuals Y - "~~ hat(Y)),
     main = "Residual")
abline(h = 0, col = "red", lwd = 2)
segments(x0 = model$fitted, y0 = 0,
         x1 = model$fitted, y1 = model$residuals,
         col = "red")

hist(model$residuals,
     main = "Histogram of Residuals",
     xlab = "Residuals",
     col = "lightblue",
     border = "blue",
     breaks = 10)

qqnorm(model$residuals, main = "Q-Q Plot of Residuals")
qqline(model$residuals, col = "red")
