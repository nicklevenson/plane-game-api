class ScoresController < ApplicationController
  def index
    scores = Score.high_scores
    render json: scores
  end
  def create
    Score.create(score_params)
    render json: {message: "success"}
  end

  private 

  def score_params
    params.require(:score).permit(:score, :user_id)
  end
end
