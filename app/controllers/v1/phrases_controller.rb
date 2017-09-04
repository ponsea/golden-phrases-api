class V1::PhrasesController < ApplicationController

  def index
    if section = params['section_id']
      @phrases = Phrase.where(section_id: section)
      render json: @phrases
    else
      render json: {message: 'section_id parameter is required'}, status: 400
    end
  end
end
