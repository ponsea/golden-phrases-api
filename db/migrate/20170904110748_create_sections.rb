class CreateSections < ActiveRecord::Migration[5.1]
  def change
    create_table :sections do |t|
      t.references :level, foreign_key: true, null: false
    end
  end
end
