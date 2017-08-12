class AddSectionToPhrases < ActiveRecord::Migration[5.1]
  def change
    add_column :phrases, :section, :integer, null: false
  end
end
