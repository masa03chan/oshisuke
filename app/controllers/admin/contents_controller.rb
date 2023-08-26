class Admin::ContentsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update]
  before_action :set_q, only: [:index, :search]

  def search
    @results = @q.result
  end

  def index
    if params[:q]
      @results = @q.result
      @contents = @q.result.page(params[:page]).per(10)
      @quantity = @q.result.count
    else
      @contents = Content.page(params[:page]).per(10)
      @quantity = Content.count
    end
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      flash[:notice] = "コンテンツ情報を編集しました。"
      redirect_to content_path(@content.id)
    else
      render :edit
    end
  end

private

  def set_q
    @q = Content.ransack(params[:q])
  end

  def content_params
    params.require(:content).permit(:image, :title, :caption, :status, :public_link)
  end
end
