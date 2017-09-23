class V1::ScoreSerializer < ApplicationSerializer
  attributes :id, :section_id, :user_id, :created_at, :correct_count, :all_count
  has_many :score_details

  def correct_count
    object.score_details.count{|v| v.correct }
  end

  def all_count
    object.score_details.size
  end
end
