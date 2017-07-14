class CreateCommits < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.references :bicycle, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
