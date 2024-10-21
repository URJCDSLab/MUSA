import pandas as pd

# Create a dataframe from the league ratings dictionary
def ratings_to_dataframe(league_ratings):
    league_ratings_df = pd.DataFrame()
    for team in league_ratings.keys():
        for player in league_ratings[team].keys():
            player_df = league_ratings[team][player]
            player_df['team'] = team
            player_df['player'] = player
            league_ratings_df = pd.concat([league_ratings_df, player_df])
    league_ratings_df = league_ratings_df.dropna(subset=['rating']) # Remove null values
    return league_ratings_df