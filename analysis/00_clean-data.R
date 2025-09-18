## 00_clean-data.R

library(dplyr)
cricket_data <- read.csv("data/cricket_asia_cup.csv", , stringsAsFactors = FALSE)

focus_team = "Pakistan"

# Create empty vectors to store results
runs_scored <- numeric()
runs_against <- numeric()
opponents <- character()
venues <- character()
years <- numeric()
results <- numeric()

for (i in seq(1, nrow(cricket_data), 2)) {
  row1 <- cricket_data[i, ]
  row2 <- cricket_data[i + 1, ]
  
  if (focus_team %in% c(row1$Team, row2$Team)) {
    
    # Determine which row is Pakistan's perspective
    if (row1$Team == focus_team) {
      pakistan_row <- row1
      opponent_row <- row2
    } else {
      pakistan_row <- row2
      opponent_row <- row1
    }
    
    # Extract the information
    runs_scored <- c(runs_scored, pakistan_row$Run.Scored)
    runs_against <- c(runs_against, opponent_row$Run.Scored)
    opponents <- c(opponents, opponent_row$Team)
    venues <- c(venues, pakistan_row$Host)
    years <- c(years, pakistan_row$Year)
    results <- c(results, pakistan_row$Result)
  }
}

team_performance <- data.frame(
  Year = years,
  Venue = venues,
  Opponent = opponents,
  Runs_Scored = runs_scored,
  Runs_Against = runs_against,
  #Result = ifelse(results == 1, "Win", "Loss")
  Result = results
)

head(team_performance)

# Summary statistics
cat(focus_team,"'s Performance Summary:\n")
cat("Total games:", nrow(team_performance), "\n")
cat("Wins:", sum(team_performance$Result == "Win"), "\n")
cat("Losses:", sum(team_performance$Result == "Loss"), "\n")
cat("Average runs scored:", mean(team_performance$Runs_Scored), "\n")
cat("Average runs against:", mean(team_performance$Runs_Against), "\n")

write.csv(team_performance, "data/cleaned_data.csv", row.names = TRUE)
