# Is Tiki-Taka Still Relevant in 2025?
**Author:** Ali Jabir

**Date of Submission:** [September 24, 2025]

This project investigates the relationship between a possession-based football strategy "Tiki-Taka" and offensive success in the English Premier League. Using data from the 2020 to 2025 seasons, a simple linear regression model was built to analyze the correlation between the number of short passes a team makes and the number of goals they score. The analysis is presented in a formal report.

## Repository Structure
The repository is organized as follows:

```{bash}
math261a-project1/
├── analysis/
│   ├── 00_clean-data.R          # script for cleaning raw data
│   ├── 01_regression.R          # script regression analysis
│   └── 03_descriptive.R         # script for descriptive analysis
├── data/
│   ├── cleaned_data.csv   # cleaned data file
│   └── data/              # Original, unprocessed data files
│       ├── season-*       # directories with raw data for a season
└── paper/
    ├── paper.qmd          # Quarto source file for the project paper
    ├── paper.pdf          # Compiled PDF of the final paper
    └── references.bib     # Bibliography file
```

**Example statement:** Data used in this project is obtained from [San Francisco Open Data](https://data.sfgov.org) who provide the data under the [Open Data Commons Public Domain Dedication and License](https://opendatacommons.org/licenses/pddl/1-0/).

## External Resources

Large Language Models (LLMs), specifically OpenAI's ChatGPT, were used as an assistant during this project. Their use was limited to the following tasks:

- Writing Assistance: Refining non-analytical sections of the report, such as the abstract, introduction, and discussion. The core analytical decisions, coding, interpretation of statistical results, and final editing were performed by the author.

- BibTeX Formatting: Helping to resolve formatting issues with the bibliography file.

# Dataset
The data used in this project was sourced from [FBref.com](fbref.com), which is powered by Sports Reference LLC.

**License:** The data is presented on FBref for personal, non-commercial use only. According to Sports Reference's terms of use, automated scraping or reuse of the data for commercial purposes is prohibited.

**Use in this Project:** This project uses the data strictly for academic and educational purposes as part of a student project. No commercial use is intended or implied. All data is attributed to its source.

# Acknowledgments
This project repository is based on the template provided by [Rohan Alexander](https://github.com/RohanAlexander/starter_folder/tree/main).
