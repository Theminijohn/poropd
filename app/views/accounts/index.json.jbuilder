json.array!(@accounts) do |account|
  json.extract! account, :id, :league_ign, :league_id, :division, :tier, :server, :league_points, :wins, :losses, :is_inactive, :is_veteran, :is_fresh_blood, :is_hot_streak, :streamer_id
  json.url account_url(account, format: :json)
end
