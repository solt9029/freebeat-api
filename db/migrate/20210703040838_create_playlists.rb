class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :title, null: false, default: ''
      t.integer :default_bpm, null: false, default: 150
      t.string :key, null: false
      t.timestamps
    end
  end
end
