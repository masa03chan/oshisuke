class ApplicationController < ActionController::Base
  before_action :set_content_search

  def set_content_search
    @search = Content.ransack(params[:q])
    @contents = @search.result
  end

end
