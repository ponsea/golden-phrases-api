class Score < ApplicationRecord
  belongs_to :user
  belongs_to :section
  has_many :score_details
end
