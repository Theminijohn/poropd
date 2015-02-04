class Streamer < ActiveRecord::Base

  extend FriendlyId
  friendly_id :twitch_username

  # Associations
  has_many :accounts

end
