class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  def index
    
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿が完了しました"
      redirect_to @post
    else
      flash.now[:alert] = "投稿に失敗しました"
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "編集が完了しました"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:university, :department, :major, :professor, :detail)
  end
end
