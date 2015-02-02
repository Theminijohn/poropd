class CreateStreamers < ActiveRecord::Migration
  def change
    create_table :streamers do |t|
      # Variables
      t.string  :name
      t.string  :slug

      # Associations
      t.integer :user_id

      # Twitch
      t.string  :twitch_username

      # League of Legends
      t.string  :server
      t.string  :league_ign
      t.string  :division
      t.string  :tier
      t.integer :league_id
      t.integer :league_points
      t.integer :current_wins
      t.integer :current_losses
      t.boolean :is_hot_streak,  default: false
      t.boolean :is_veteran,     default: false
      t.boolean :is_fresh_blood, default: false
      t.boolean :is_inactive,    default: false

      t.timestamps null: false
    end
    add_index :streamers, :twitch_username
    add_index :streamers, :name
    add_index :streamers, :slug
    add_index :streamers, :league_ign
    add_index :streamers, :league_id
    add_index :streamers, :user_id
  end
end
