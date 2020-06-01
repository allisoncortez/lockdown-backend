class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :score
      # t.references :player, null: false, foreign_key: true => taken out(null:false) bc of postgrs error
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
