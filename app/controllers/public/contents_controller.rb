class Public::ContentsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def search
    @results = @q.result
  end

  def new
  end

  def index
    if params[:q]
      @results = @q.result
      @contents = @q.result.where(is_active: true).page(params[:page]).per(8)
      @quantity = @q.result.where(is_active: true).count
    else
      @contents = Item.where(is_active: true).page(params[:page]).per(8)
      @quantity = Item.count
    end
  end

private

  def set_q
    @q = Content.ransack(params[:q])
  end
end
