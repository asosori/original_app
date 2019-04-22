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
      redirect_to root_url and return
    else
      @q = Post.ransack(params[:q])
      @posts = @q.result.includes(:user, :like_users, :likes).page(params[:page]).per(10)
      unless @posts.first
        flash.now[:alert] = "該当する口コミは見つかりませんでした"
        render template: "home/top" and return
      end
    end
    render layout: "second_layout"
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
