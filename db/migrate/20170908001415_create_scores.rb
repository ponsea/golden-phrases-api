class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.references :user, foreign_key: true, null: false
      t.references :section, foreign_key: true, null: false
      t.datetime :created_at, null: false
    end
  end
end
