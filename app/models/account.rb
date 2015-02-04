require 'lol'
require 'open-uri'
class Account < ActiveRecord::Base

  # Assocations
  belongs_to :streamer

  # Update Account Information
  def update_information
    # Update Account
    client = Lol::Client.new Settings.rito.api_key, {region: self.server}

    # Get League Account
    unless self.league_id.present?
      data = client.summoner.by_name(self.league_ign)
      self.update_attribute(:league_id, data[0].id)
    end

    # Update Account
    data = client.stats.summary(league_id)
    stats = data[3]

    # Just to be sure check if its the correct Type
    if stats.player_stat_summary_type == "RankedSolo5x5"
      self.wins                         = stats.wins
      self.losses                       = stats.losses
      self.total_champion_kills         = stats.aggregated_stats['total_champion_kills']
      self.total_turrets_killed         = stats.aggregated_stats['total_turrets_killed']
      self.total_minion_kills           = stats.aggregated_stats['total_minion_kills']
      self.total_neutral_minions_killed = stats.aggregated_stats['total_neutral_minions_killed']
      self.total_assists                = stats.aggregated_stats['total_assists']

      # save
      self.save
    end

    # Get Division Info

    league = JSON.load(open("https://eune.api.pvp.net/api/lol/#{self.server}/v2.5/league/by-summoner/#{self.league_id}/entry?api_key=#{Settings.rito.api_key}"))

    binding.pry

    self.tier           = league.first[1][0]['tier']
    self.division       = league.first[1][0]['entries'][0]['division']
    self.division_name  = league.first[1][0]['name']
    self.league_points  = league.first[1][0]['entries'][0]['leaguePoints']
    self.is_veteran     = league.first[1][0]['entries'][0]['isVeteran']
    self.is_inactive    = league.first[1][0]['entries'][0]['isInactive']
    self.is_hot_streak  = league.first[1][0]['entries'][0]['isHotStreak']
    self.is_fresh_blood = league.first[1][0]['entries'][0]['IsFreshBlood']

    # save
    self.save

  end

end
