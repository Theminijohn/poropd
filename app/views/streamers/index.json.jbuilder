json.array!(@streamers) do |streamer|
  json.extract! streamer, :id, :twitch_username, :name, :server, :slug, :league_ign, :league_id, :division, :tier, :league_points, :current_wins, :current_losses, :is_hot_streak, :is_veteran, :is_fresh_blood, :is_inactive
  json.url streamer_url(streamer, format: :json)
end
