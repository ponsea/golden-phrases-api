class V1::PhrasesController < ApplicationController

  def index
    @phrases = Phrase.all

    render json: @phrases
  end
end
