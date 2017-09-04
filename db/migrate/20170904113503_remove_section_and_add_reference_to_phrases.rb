class RemoveSectionAndAddReferenceToPhrases < ActiveRecord::Migration[5.1]
  def change
    remove_column :phrases, :section
    add_reference :phrases, :section, foreign_key: true
  end
end
