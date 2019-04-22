class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :likes]
  before_action :correct_user, only: [:show, :likes]

  layout "second_layout"

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

  def likes
    @posts = current_user.like_posts.includes(:user, :like_users, :likes).page(params[:page]).per(10)
  end

end
