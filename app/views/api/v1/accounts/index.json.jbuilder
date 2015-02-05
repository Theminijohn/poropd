json.array! @accounts do |account|
  json.tier                          account.tier
  json.server                        account.server
  json.division                      account.division
  json.league_ign                    account.league_ign
  json.division_name                 account.division_name
  json.wins                          account.wins
  json.losses                        account.losses

  json.total_champion_kills          account.total_champion_kills
  json.total_minion_kills            account.total_minion_kills
  json.total_turrets_killed          account.total_turrets_killed
  json.total_neutral_minions_killed  account.total_neutral_minions_killed
  json.total_assists                 account.total_assists

  json.league_id                     account.league_id
  json.league_points                 account.league_points

  json.is_veteran                    account.is_veteran
  json.is_inactive                   account.is_inactive
  json.is_hot_streak                 account.is_hot_streak
  json.is_fresh_blood                account.is_fresh_blood

  json.streamer_id                   account.streamer_id
end