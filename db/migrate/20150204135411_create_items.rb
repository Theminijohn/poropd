class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|


      t.integer :league_id
      t.string  :plaintext
      t.string  :name
      t.string  :group
      t.text    :description
      t.string  :image

      # FriendlyID
      t.string  :slug

      t.timestamps null: false
    end
    add_index :items, :league_id
    add_index :items, :name
    add_index :items, :slug
  end
end
