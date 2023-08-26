class Public::EventsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  before_action :set_content
  before_action :set_event, only: [:show, :edit, :update]

  def search
    @results = @q.result
  end

  def new
    @event = @content.events.new
    @default_date = params[:default_date]&.to_date
  end

  def create
    @event = @content.events.new(event_params)
    if @event.save
      flash[:notice] = "イベントを登録しました。"
      redirect_to content_event_path(@content, @event)
    else
      render :new
    end
  end

  def index
    @events = @content.events
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "イベント情報を編集しました。"
      redirect_to content_event_path(@content, @event)
    else
      render :edit
    end
  end

private

  def set_q
    @q = Event.ransack(params[:q])
  end

  def set_content
    @content = Content.find(params[:content_id])
  end

  def set_event
    @event = @content.events.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :caption, :start_time, :place, :end_time, :links)
  end

end
