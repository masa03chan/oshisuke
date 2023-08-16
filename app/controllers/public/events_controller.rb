class Public::EventsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def search
    @results = @q.result
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "イベントを登録しました。"
      redirect_to content_event_path(@event.id)
    else
      render :new
    end
  end

  def index
    @content = Content.find(params[:content_id])
    @events = Event.all
  end

  def show
    @event= Event.find(params[:id])
  end

  def edit
    @event= Event.find(params[:id])
  end

  def update
    @event= Event.find(params[:id])
    if @event.update(content_params)
      flash[:notice] = "イベント情報を編集しました。"
      redirect_to content_event_path(@event.id)
    else
      render :edit
    end
  end

private

  def set_q
    @q = Event.ransack(params[:q])
  end

  def event_params
    params.require(:event).permit(:title, :caption, :start_time, :place, :end_time, :link)
  end

end
