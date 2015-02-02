require 'net/http'
require 'open-uri'
require 'json'
require 'pp'

class Streamer < ActiveRecord::Base

  extend FriendlyId
  friendly_id :league_ign

  # def update_info
  #   # 62374009

  #   url = "https://na.api.pvp.net/api/lol/na/v2.5/league/by-summoner/#{self.league_id}/entry?api_key=#{Settings.rito.api_key}"
  #   output = JSON.load(open(url))

  #   self.tier = output["#{self.league_id}"][0]['tier']
  #   self.division = output["#{self.league_id}"][0]['entries'][0]['division']
  #   self.league_points = output["#{self.league_id}"][0]['entries'][0]['leaguePoints']
  #   self.current_wins = output["#{self.league_id}"][0]['entries'][0]['wins']
  #   self.current_losses = output["#{self.league_id}"][0]['entries'][0]['losses']

  #   self.is_hot_streak  = output["#{self.league_id}"][0]['entries'][0]['isHotStreak']
  #   self.is_veteran     = output["#{self.league_id}"][0]['entries'][0]['isVeteran']
  #   self.is_fresh_blood = output["#{self.league_id}"][0]['entries'][0]['isFreshBlood']
  #   self.is_inactive    = output["#{self.league_id}"][0]['entries'][0]['isInactive']

  #   self.save
  # end

  def division_info
    "#{self.tier.downcase.capitalize} #{self.division}"
  end


end
