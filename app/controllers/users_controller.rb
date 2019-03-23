class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :correct_user, only: [:show]

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end

  def show
    @post = current_user.posts.first
  end

  
end
