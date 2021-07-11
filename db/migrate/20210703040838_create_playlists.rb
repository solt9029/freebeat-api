class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :title, null: false, default: ''
      t.integer :default_bpm, null: true, default: 150
      t.float :max_playback_rate, null: true, default: 1.5
      t.float :min_playback_rate, null: true, default: 0.75
      t.string :key, null: false
      t.timestamps
    end
  end
end
