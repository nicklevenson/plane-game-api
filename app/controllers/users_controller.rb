class UsersController < ApplicationController
  def create
    user = User.find_or_create_by(user_params)
    scores = user.scores.collect{|s|"#{s.created_at.strftime('%b %e, %l:%M %p')}: #{s.score}"}.reverse
    if user.save
      render json: {username: user.username, id: user.id, scores: scores}
    else
      render json: {error: {message: "Username cannot be blank"}}, status: 400
    end
  end

  def show
    user = User.find(params[:id])
    scores = user.scores.collect{|s|"#{s.created_at.strftime('%b %e, %l:%M %p')}: #{s.score}"}.reverse
    render json: {username: user.username, id: user.id, scores: scores}
  end

  private

  def user_params

    params.require(:user).permit(:username)
  end
end
