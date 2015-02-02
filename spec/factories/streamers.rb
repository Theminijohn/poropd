# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :streamer do
    twitch_username "MyString"
    name "MyString"
    server "MyString"
    slug "MyString"
    league_ign "MyString"
    league_id 1
    division "MyString"
    tier "MyString"
    league_points 1
    current_wins 1
    current_losses 1
    is_hot_streak false
    is_veteran false
    is_fresh_blood false
    is_inactive "MyString"
  end
end
