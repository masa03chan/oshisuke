class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @end_users = EndUser.page(params[:page]).per(10)
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      flash[:notice] = "会員情報を編集しました。"
      redirect_to admin_end_users_path
    else
      render :edit
    end
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :email, :profile_image, :caption, :encrypted_password, :is_deleted)
  end
end