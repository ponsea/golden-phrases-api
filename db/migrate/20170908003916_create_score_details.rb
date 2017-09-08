class CreateScoreDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :score_details do |t|
      t.references :score, foreign_key: true, null: false
      t.references :phrase, foreign_key: true, null: false
      t.boolean :correct, null: false
    end
  end
end
