class Public::EndUsersController < ApplicationController
  before_action :set_end_user
  #before_action :set_bookmark, only: [:show]

  def show
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to end_user_path(current_end_user)
    else
      render :edit
    end
  end

  def delete_confirm
  end

  def delete_process
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end



  private

  def set_end_user
    @end_user = EndUser.find(current_end_user.id)
  end

  #def set_bookmark
    #@content = Content.find(params[:content_id])
    #@event = @content.events.find(params[:event_id])
  #end

  def end_user_params
    params.require(:end_user).permit(:name, :email, :profile_image, :caption, :encrypted_password)
  end

end
