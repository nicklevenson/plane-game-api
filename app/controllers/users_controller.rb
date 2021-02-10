class UsersController < ApplicationController
  def index

  end

  def create
    user = User.create(user_params)
    render json: user
    byebug
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
