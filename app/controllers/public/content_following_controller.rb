class Public::ContentFollowingController < ApplicationController
  def create
    @content_following = ContentFollowing.new(user_id: current_user.id, content_id: params[:content_id])
    @content_following.save
    redirect_to content_path(params[:content_id])
  end

  def destroy
    @content_following = ContentFollowing.find_by(user_id: current_user.id, content_id: params[:content_id])
    @content_following.destroy
    redirect_to content_path(params[:content_id])
  end
end
