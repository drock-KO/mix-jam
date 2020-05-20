class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.string :title, index: true, null: false
      t.string :data, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
