# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account do
    league_ign "MyString"
    league_id 1
    division "MyString"
    tier "MyString"
    server "MyString"
    league_points 1
    wins 1
    losses 1
    is_inactive false
    is_veteran false
    is_fresh_blood false
    is_hot_streak false
    streamer_id 1
  end
end
