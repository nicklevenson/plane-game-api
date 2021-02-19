class ScoresController < ApplicationController
  def index
    scores = Score.high_scores
    all = Score.all.count
    render json: {scores: scores, all: all}
  end
  def create
    Score.create(score_params)
    render json: {message: "success"}
    # if score_params[:score] > Score.high_scores[-1]
      # Score.high_scores[-1].destroy
      # Score.create(score_params)
    #end
  end

  private 

  def score_params
    params.require(:score).permit(:score, :user_id)
  end
end
