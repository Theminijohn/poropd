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

      t.timestamps null: false
    end
    add_index :streamers, :twitch_username
    add_index :streamers, :name
    add_index :streamers, :slug
    add_index :streamers, :user_id
    
  end
end
