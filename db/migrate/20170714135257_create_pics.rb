class CreatePics < ActiveRecord::Migration[5.0]
  def change
    create_table :pics do |t|
      t.string :image
      t.string :name
      t.references :bicycle, foreign_key: true

      t.timestamps
    end
  end
end
