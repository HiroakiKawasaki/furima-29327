class UsersController < ApplicationController

  def new
    @users = User.all
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
