class HomeController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
  end

  def inquire
  end

end
