class CreateBicycles < ActiveRecord::Migration[5.0]
  def change
    create_table :bicycles do |t|
      t.string :name, limit: 100
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :bicycles, :name, unique: true
  end
end
