class Section < ApplicationRecord
  belongs_to :level
  has_many :phrases
  has_many :scores
end
