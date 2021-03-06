class HomeController < ApplicationController
  before_action :is_logged?, only: [:show_user, :profile]
  before_action :get_liked_users , only: [:show_user, :profile]

  def index
  end

  def show_user
    randomUsers  = User.where.not(id: current_user.id).order("RANDOM()")
    if @liked_users
      @filtered_randomUsers = Array.new
      toggle = true
      randomUsers.each do |randomUser|
        @liked_users.each do |liked_user|
          toggle = true
          if randomUser.id == liked_user[0].id
            toggle = false
            break
          end
        end
        @filtered_randomUsers.push(randomUser) if toggle
      end
    else
      @filtered_randomUsers = randomUsers
    end
  end

  def profile
    
  end

  def get_liked_users
    likes = Like.where(liker: current_user.id)
    if likes
      @liked_users = Array.new
      likes.each do |like|
        @liked_users.push([User.find(like.likee),like.matched])
      end
    end
  end

  def is_logged?
    if !user_signed_in?
      redirect_to root_path
    end
  end

end
