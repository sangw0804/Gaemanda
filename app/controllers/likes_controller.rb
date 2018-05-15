class LikesController < ApplicationController
  def update
    like = Like.new(liker: params[:liker_id], likee:params[:likee_id])
    like.save

    check_is_matched(like)

    redirect_to show_user_path(current_user.id)
  end

  def delete
    like = Like.where(liker: params[:liker_id]).where(likee: params[:likee_id]).first

    check_is_unmatched(like)

    like.destroy

    redirect_to user_profile_path(current_user.id)
  end

  def check_is_matched(like)
    if like1 = Like.where(liker: like.likee).where(likee: like.liker).first
      tempsort = [like.liker,like.likee].sort
      match = Match.new(user1: tempsort[0], user2: tempsort[1])
      match.save
      like1.update_attributes(matched: match.id)
      like.update_attributes(matched: match.id)
    end
  end

  def check_is_unmatched(like)
    if like1 = Like.where(liker: like.likee).where(likee: like.liker).first
      like1.update_attributes(matched: nil)
      like.update_attributes(matched: nil)
      tempsort = [like.liker,like.likee].sort
      match = Match.where(user1: tempsort[0]).where(user2: tempsort[1]).first
      match.destroy
    end
  end
end
