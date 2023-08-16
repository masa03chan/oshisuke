class ApplicationController < ActionController::Base
  before_action :set_content_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_time_zone, if: :user_signed_in?
  before_action :set_beginning_of_week


  def set_content_search
    @search = Content.ransack(params[:q])
    @contents = @search.result
  end

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_time_zone
    Time.zone = current_user.time_zone
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
