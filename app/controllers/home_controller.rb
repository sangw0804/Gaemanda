class HomeController < ApplicationController
  before_action :is_logged?, only: [:show_user,:show_ajax, :profile, :matching]
  before_action :get_liked_users , only: [:show_user,:show_ajax, :profile, :matching]

  def index
  end

  def about
  end
  
  def start
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
    @filtered_randomUser = @filtered_randomUsers.sample(1).first
  end

  def show_ajax
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
    @filtered_randomUser = @filtered_randomUsers.sample(1).first
  end

  def profile
  end

  def matching
    @recent_messages = Array.new
    @liked_users.each do |liked_user|
      @recent_messages[liked_user.first.id] = Post.where(match_id: liked_user[1]).last
    end
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
