class Public::ContentsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def search
    @results = @q.result
  end

  def new
  end

  def index
    @contents = Contents.all
  end

private

  def set_q
    @q = Content.ransack(params[:q])
  end
end
