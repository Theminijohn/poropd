ActiveAdmin.register Account do

  permit_params :tier, :server, :division, :league_ign, :division_name, :wins, :losses,
    :league_id, :league_points, :is_veteran, :is_inactive, :is_hot_streak, :is_fresh_blood,
    :streamer_id, :total_champion_kills, :total_minion_kills, :total_turrets_killed, 
    :total_neutral_minions_killed, :total_assists

  # Index
  index do
    column :league_ign
    column :league_id
    column :division
    actions
  end

  action_item :update, only: :show do
    link_to 'Update Account', update_information_account_path(1)
  end

  # Form
  form do |f|

    inputs 'Update' do

    end

    inputs 'Account' do
      f.input  :league_ign, placeholder: 'League IGN'
      f.input  :league_id, placeholder: 'League Summoner Id'
    end

    inputs 'Account' do
      f.input  :server, as: :select, collection: ['br', 'eune', 'euw', 'kr', 'lan', 'as', 'na', 'oce', 'ru', 'tr']
      f.input  :tier
      f.input  :division
      f.input  :division_name
      f.input  :wins
      f.input  :losses
      f.input  :league_points

      f.input  :total_champion_kills
      f.input  :total_minion_kills
      f.input  :total_turrets_killed
      f.input  :total_neutral_minions_killed
      f.input  :total_assists

      f.input  :is_veteran, as: :boolean
      f.input  :is_inactive, as: :boolean
      f.input  :is_hot_streak, as: :boolean
      f.input  :is_fresh_blood, as: :boolean
    end

    inputs 'Streamer' do
      f.input :streamer_id
    end

    f.actions
  end


end