# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create Streamers

Streamer.create(
  name:            'imaqtpie',
  twitch_username: 'imaqtpie',
  server:          'na',
  league_ign:      'B1G Kr1T',
  league_id:       '20964624'
)