class ContentsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @content = Content.new
  end
  
  def create
    @content = current_user.contents.build(content_params)
    if @content.save
      flash[:success] = '作品を投稿しました。'
      redirect_to @content
    else
      flash.now[:danger] = '作品の投稿に失敗しました。'
      render :new
    end
  end
  
  def edit
    @content = Content.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:id])

    if @content.update(content_params)
      flash[:success] = '正常に更新されました'
      redirect_to @content
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @content.destroy
    flash[:success] = '作品を削除しました。'
    render 'toppages/index'
  end
  
  def show
     @content = Content.find(params[:id])
  end
  
  
  private

  def content_params
    params.require(:content).permit(:title, :description, :prefecture_id, :image, :image_cache)
  end
  
  def correct_user
    @content = current_user.contents.find_by(id: params[:id])
    unless @content
      redirect_to root_url
    end
  end
end
