class Phrase < ApplicationRecord
  belongs_to :section
  has_many :score_details
end
