class Public::BookmarksController < ApplicationController
  before_action :set_content
  before_action :set_event
  before_action :set_bookmark, only: [:destroy]

  def create
  end

  def destroy
  end

  private

  def set_content
    @content = Content.find(params[:content_id])
  end

  def set_event
    @event = @content.events.find(params[:event_id])
  end

  def set_bookmark
    @bookmark = @event.bookmarks.find(params[:id])
  end

end
