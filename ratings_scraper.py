# -*- coding: utf-8 -*-
"""
Ratings sofascore

@author: Álvaro Novillo Correas
"""

import requests
from bs4 import BeautifulSoup
import pandas as pd
import datetime
import numpy as np
from collections import defaultdict 
import json
import traceback
########################### SOFASCORE SCRAPER ######################################
from Sofascore import Sofascore

####################################################################################
def league_matches(league_name="La Liga", year='23/24', scraper = Sofascore()):
    
    sofascore = scraper
    
    # Scrape team IDs based on the league name
    league_matches = sofascore.scrape_league_matches(year=year, league=league_name)
    return league_matches
    
def read_league_table(league_name="La Liga", year='23/24', scraper = Sofascore()):
    
    sofascore = scraper
    
    # Scrape team IDs based on the league name
    league_table = sofascore.read_league_table(year=year, league=league_name)
    return league_table
    


def scrape_ratings(league_name="La Liga", year='23/24', scraper=Sofascore()):

    sofascore = scraper

    # Scrape team IDs based on the league name
    league_matches = sofascore.scrape_league_matches(year=year, league=league_name)

    # Scrape the table up to today
    league_table = sofascore.read_league_table(year=year, league=league_name)

    data = {}  

    for _round in np.unique(league_matches.Round):
        round_matches = league_matches[league_matches.Round == _round]
        for match in round_matches.ID:
            if league_matches[league_matches.ID == match].Result.values[0] != np.nan:
                date = league_matches[league_matches.ID == match].Date.values[0]

                team_names = sofascore.get_team_names(match)
                teams_joined = ' - '.join(team_names)

                try:
                    player_stats = sofascore.get_players_match_stats(match)
                    for i, team in enumerate(team_names):
                        if team not in data:
                            data[team] = {}  # Initialize sub-dictionary for the team
                        for index, row in player_stats[i].iterrows():
                            try:
                                rating = row.rating
                                if rating == 0:
                                    rating = 7.0
                                elif rating > 10:
                                    rating = 10
                            except AttributeError:
                                rating = np.nan

                            dataframe = pd.DataFrame({
                                'date': date,
                                'rating': rating,
                                'match': teams_joined
                            }, index=pd.RangeIndex(start=0, stop=1, step=1))

                            if row['name'] in data[team]:
                                data[team][row['name']] = pd.concat([dataframe, data[team][row['name']]])
                            else:
                                data[team][row['name']] = dataframe
                except:
                    continue

    # Sorting the data
    for team in data:
        for player in data[team]:
            data[team][player] = data[team][player].sort_values(by='date').reset_index(drop=True)

    return data




