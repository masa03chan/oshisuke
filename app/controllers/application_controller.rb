class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_time_zone, if: :user_signed_in?
  before_action :set_beginning_of_week
  before_action :set_content_search


  def set_content_search
    @search = Content.ransack(params[:q])
    @contents = @search.result
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      contents_path
    when User
      root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      top_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :name, :caption, :profile_image])
  end

  def set_time_zone
    Time.zone = current_user.time_zone
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
