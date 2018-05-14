class HomeController < ApplicationController
  def index
  end

  def show_user
    @randomUser  = User.where.not(id: current_user.id).order("RANDOM()").limit(1).first
  end

  def profile
    @user = User.find(params[:user_id])
    likes = Like.where(liker: current_user.id)
    @liked_users = Array.new
    likes.each do |like|
      @liked_users.push(User.find(like.likee))
    end
  end
end
