class Section < ApplicationRecord
  belongs_to :level
  has_many :phrases
end
