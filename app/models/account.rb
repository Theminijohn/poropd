class Account < ActiveRecord::Base

  # Assocations
  belongs_to :streamer

  # Update Account Information
  def update_intel
    # Update Account
    client = Lol::Client.new Settings.rito.api_key, {region: 'na'}

    client.league.get(self.league_id)
    # => Lol::League
  end

end
