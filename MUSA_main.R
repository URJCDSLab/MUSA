
library(reticulate)
reticulate::use_python("C:/Users/pc/AppData/Local/r-reticulate/r-reticulate/pyenv/pyenv-win/versions/3.10.11/python.exe") #change it to your path
use_virtualenv("MUSA")

# Load python scraper
reticulate::source_python("ratings_scraper.py")
###################### FUNCTIONS AVALIABLE #########################################
# league_matches(league_name, year)
# inputs:
# - league_name: String with the league name: Valid ones:
# ['Champions League', 'Europa League', 'Europa Conference League', 'EPL', 'La Liga', 'Bundesliga', 'Serie A', 'Ligue 1', 'Argentina Liga Profesional', 'Argentina Copa de la Liga Profesional', 'MLS', 'USL Championship', 'USL1', 'USL2', 'World Cup', 'Euros', 'Gold Cup', "Women's World Cup"]
# - year: Season desired, a string with format "23/24"

# Outputs:
# league_matches: a data.frame structure with all matches played in all rounds. it also shows date and score (if available)
#####################################

# read_league_table(league_name, year)
# inputs:
# - league_name: String with the league name: Valid ones:
# ['Champions League', 'Europa League', 'Europa Conference League', 'EPL', 'La Liga', 'Bundesliga', 'Serie A', 'Ligue 1', 'Argentina Liga Profesional', 'Argentina Copa de la Liga Profesional', 'MLS', 'USL Championship', 'USL1', 'USL2', 'World Cup', 'Euros', 'Gold Cup', "Women's World Cup"]
# - year: Season desired, a string with format "23/24"

# Outputs:
# league_table: a data.frame structure with the team classification in the league (up to date)
####################################################

# scrape_ratings(league_name, year)
  # inputs:
    # - league_name: String with the league name: Valid ones:
    # ['Champions League', 'Europa League', 'Europa Conference League', 'EPL', 'La Liga', 'Bundesliga', 'Serie A', 'Ligue 1', 'Argentina Liga Profesional', 'Argentina Copa de la Liga Profesional', 'MLS', 'USL Championship', 'USL1', 'USL2', 'World Cup', 'Euros', 'Gold Cup', "Women's World Cup"]
    # - year: Season desired, a string with format "23/24"

  # Outputs:
    # player_rating: Dictionary of teams and players, containing data.frames of the ratings of each of the players

###############################################################
league_matches <- league_matches("La Liga", "23/24")

league_table <- read_league_table("La Liga", "23/24")

ratings <- scrape_ratings("La Liga", "23/24")


