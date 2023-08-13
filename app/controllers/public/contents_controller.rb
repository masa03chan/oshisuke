class Public::ContentsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  def search
    @results = @q.result
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      flash[:notice] = "コンテンツを登録しました。"
      redirect_to content_path(@content.id)
    else
      render :new
    end
  end

  def index
    if params[:q]
      @results = @q.result
      @contents = @q.result.where(status: true).page(params[:page]).per(10)
      @quantity = @q.result.where(status: true).count
    else
      @contents = Content.where(status: true).page(params[:page]).per(10)
      @quantity = Content.count
    end
  end

  def show
    @content = Content.find(params[:id])
  end

private

  def set_q
    @q = Content.ransack(params[:q])
  end

  def content_params
    params.require(:content).permit(:image, :title, :caption, :status, :public_link)
  end

end
