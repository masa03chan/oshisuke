class ApplicationController < ActionController::Base
  before_action :set_content_search
  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_content_search
    @search = Content.ransack(params[:q])
    @contents = @search.result
  end

private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
  end
end
