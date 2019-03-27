class HomeController < ApplicationController
  def top
    @q = Post.ransack(params[:q])
  end

  def inquire
    @inquiry = Inquiry.new
  end

end
