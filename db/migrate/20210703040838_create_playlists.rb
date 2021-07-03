class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :title, null: false
      t.integer :default_bpm
      t.timestamps
    end
  end
end
