class CreateTrackTags < ActiveRecord::Migration[5.2]
  def change
    create_table :track_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.timestamps
    end
  end
end
