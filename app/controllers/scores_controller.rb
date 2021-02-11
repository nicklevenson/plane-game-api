class ScoresController < ApplicationController
  def create
    Score.create(score_params)
  end

  private 

  def score_params
    params.require(:score).permit(:score, :user_id)
  end
end
