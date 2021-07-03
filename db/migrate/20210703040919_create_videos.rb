class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :video_id, null: false
      t.integer :bpm
      t.belongs_to :playlist, null: false, foreign_key: true, index: true
      t.timestamps
    end
    add_index :videos, [:video_id, :playlist_id], unique: true
  end
end
