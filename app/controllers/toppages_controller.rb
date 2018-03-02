class ToppagesController < ApplicationController
  def index
    @prefectures = Prefecture.all
    if params[:search].present? && params[:search][:prefecture].present?
      @contents = Content.where(prefecture_id: params[:search][:prefecture]).order('updated_at DESC')
    else
      @contents = Content.order('updated_at DESC')
    end
  end
end
