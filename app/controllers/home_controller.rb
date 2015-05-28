class HomeController < ApplicationController

  respond_to :html

  def index
    @posts =  Post.order('comments_count DESC').limit(5)
  end
end
