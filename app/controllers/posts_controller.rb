class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :correct_postuser, only: [:edit, :update, :destroy]

  def correct_postuser
    @post = Post.find(params[:id])
    unless @post.user == current_user
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end

  def search
    if params[:q][:university_cont].empty? && params[:q][:department_cont].empty? && params[:q][:major_cont].empty? && params[:q][:professor_cont].empty?
      flash[:alert] = "検索項目を入力してください"
      redirect_to root_url
    else
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:user)
    end
  end

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
  end

  def update
    if @post.update_attributes(post_params)
      flash[:success] = "編集が完了しました"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to current_user
  end

  private

  def post_params
    params.require(:post).permit(:university, :department, :major, :professor, :detail)
  end

end