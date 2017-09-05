class V1::LevelSerializer < ApplicationSerializer
  attributes :id, :title
  has_many :sections
end
