class RemoveLevelFromPhrases < ActiveRecord::Migration[5.1]
  def change
    remove_column :phrases, :level
  end
end
