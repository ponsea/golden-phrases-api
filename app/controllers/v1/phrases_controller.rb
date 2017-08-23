class V1::PhrasesController < ApplicationController

  def index
    if section = params['section']
      @phrases = Phrase.where(section: section)
      render json: @phrases
    else
      render json: {message: 'section parameter is required'}, status: 400
    end
  end
end
