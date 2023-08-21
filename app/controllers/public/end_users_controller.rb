class Public::EndUsersController < ApplicationController

  def update
    if @end_user.update(end_user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def end_user_params
    params.require(:end_end_user).permit(:name, :email, :profile_image)
  end

end
