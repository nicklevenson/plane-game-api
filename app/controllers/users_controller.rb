class UsersController < ApplicationController
  def index

  end

  def create
    user = User.find_or_create_by(user_params)
    scores = user.scores.collect{|s|s.score}
    if user.save
      render json: {username: user.username, id: user.id, scores: scores}
    else
      render json: {error: {message: "Username cannot be blank"}}, status: 400
    end
  end

  private

  def user_params

    params.require(:user).permit(:username)
  end
end
