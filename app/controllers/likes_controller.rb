class LikesController < ApplicationController
  def update
    like = Like.new(liker: params[:liker_id], likee:params[:likee_id])
    like.save

    redirect_to show_user_path
  end
end
