class ToppagesController < ApplicationController
  def index
    @contents = Content.order('updated_at DESC')
  end
end
