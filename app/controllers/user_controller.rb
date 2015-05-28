class UserController < ApplicationController
  before_filter :check_visibility, only: [:index, :destroy]
  before_filter :authenticate_user!, only: [:statistics]

  respond_to :html

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  def statistics
    @users = User.order('comments_count DESC', 'posts_count DESC')
  end

  private
    def check_visibility
      redirect_to root_path unless current_user && current_user.admin
    end
end
