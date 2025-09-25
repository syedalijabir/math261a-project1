## 00_clean-data.R

library(dplyr)

data_dir <- "data"
seasons <- c("20-21", "21-22", "22-23", "23-24", "24-25")

combined_df <- data.frame()

for (season in seasons) {
  passing_file_path <- paste0(data_dir, "/season-", season, "/", "squad-passing.csv")
  std_file_path <- paste0(data_dir, "/season-", season, "/", "standard-stats.csv")
  
  squad_passing  <- read.csv(passing_file_path, skip = 1)
  standard_stats <- read.csv(std_file_path,     skip = 1)
    
  season_df <- data.frame(
    Team = squad_passing$Squad,
    Season = season,
    Short_Passes = squad_passing$Cmp.1,
    Goals = standard_stats$Gls
  )
    
  combined_df <- rbind(combined_df, season_df)
}

head(combined_df)

write.csv(combined_df, "data/cleaned_data.csv", row.names = TRUE)
