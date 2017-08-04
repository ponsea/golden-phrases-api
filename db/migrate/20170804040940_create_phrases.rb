class CreatePhrases < ActiveRecord::Migration[5.1]
  def change
    create_table :phrases do |t|
      t.integer :number, null: false
      t.string :phrase_ja, limit: 128, null: false
      t.string :phrase_en, limit: 128, null: false
      t.string :answer, limit: 32, null: false
      t.string :meanings, limit: 64, null: false
      t.integer :level, limit: 1
      t.text :explanation
    end
  end
end
