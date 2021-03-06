class V1::ScoresController < ApplicationController
  before_action :authenticate_v1_user!

  def index
    if section = params[:section_id]
      scores = Score
        .where(user: current_v1_user)
        .where(section_id: section)
        .order(created_at: :desc)
      if params[:recent]
        render json: scores.first
      else
        render json: scores, include: {}, root: :data
      end
    elsif params[:max]
      scores = max_scores(current_v1_user.id)
      body = {data: scores}.to_camelback_keys
      render json: body
    else
      body = {message: 'section_id or max parameter is required'}
      render json: body, status: 400
    end
  end

  def create
    score = Score.new(section_id: params[:section_id], user: current_v1_user)
    details = params[:details]
    details.each do |detail|
      score.score_details << ScoreDetail.new(phrase_id: detail[0], correct: detail[1])
    end

    if score.save
      render json: score, status: :created
    else
      render json: score.errors, status: :unprocessable_entity
    end
  end

  private
  def max_scores(user_id)
    con = ActiveRecord::Base.connection
    template = <<~EOS
      SELECT SUM.section_id, MAX(SUM.correct_count) AS correct_count, SUM.all_count
      FROM (SELECT SUM(CASE WHEN SD.correct = TRUE THEN 1 ELSE 0 END) AS correct_count,
                   COUNT(*) AS all_count,
                   S.section_id
            FROM scores S INNER JOIN score_details SD
                          ON S.id = SD.score_id
            WHERE S.user_id = :user_id
            GROUP BY S.id, S.section_id) AS SUM
      GROUP BY SUM.section_id, SUM.all_count
    EOS
    sql = ActiveRecord::Base.send(:sanitize_sql_array, [template, user_id: user_id])
    con.select_all(sql).to_hash
  end
end
