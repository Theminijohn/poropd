class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|

      # League of Legends
      t.string  :tier
      t.string  :server
      t.string  :division
      t.string  :league_ign
      t.string  :division_name
      t.integer :wins
      t.integer :losses

      # Aggregated Stats
      t.integer :total_champion_kills
      t.integer :total_minion_kills
      t.integer :total_turrets_killed
      t.integer :total_neutral_minions_killed
      t.integer :total_assists
      
      t.integer :league_id
      t.integer :league_points

      # Division Badges
      t.boolean :is_veteran, default: false
      t.boolean :is_inactive, default: false
      t.boolean :is_hot_streak, default: false
      t.boolean :is_fresh_blood, default: false

      # Association
      t.integer :streamer_id

      t.timestamps null: false
    end
    add_index :accounts, :league_ign
    add_index :accounts, :league_id
    add_index :accounts, :streamer_id
  end
end
