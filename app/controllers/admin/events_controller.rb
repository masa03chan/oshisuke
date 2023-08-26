class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]
  before_action :set_content
  before_action :set_event

  def destroy
    @event.destroy
    flash[:notice] = "イベントを削除しました。"
    redirect_to content_events_path(@content)
  end

  private
  def set_content
    @content = Content.find(params[:content_id])
  end

  def set_event
    @event = @content.events.find(params[:id])
  end
end
