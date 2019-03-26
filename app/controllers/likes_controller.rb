class LikesController < ApplicationController
  before_action :login_user
  before_action :current_user_is_not_post_user

  def login_user
    unless user_signed_in?
      flash[:danger] = "この機能はログイン後に利用いただけます"
      redirect_back(fallback_location: root_url)
    end
  end

  def current_user_is_not_post_user
    if current_user == Post.find(params[:post_id]).user
      flash[:danger] = "自分で作成した投稿なので、この機能は利用いただけません"
      redirect_back(fallback_location: root_url)
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    @post.reload
    respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes.find_by(user_id: current_user.id).destroy
    @post.reload
    respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
    end
  end
end
