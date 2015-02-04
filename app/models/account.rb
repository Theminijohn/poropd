require 'lol'
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
    binding.pry
    data = client.stats.summary(league_id)
    stats = data[3]

    # Just to be sure check if its the correct Type
    if stats.player_stat_summary_type == "RankedSolo5x5"
      self.wins   = stats.wins
      self.losses = stats.losses
    end





  end

end
