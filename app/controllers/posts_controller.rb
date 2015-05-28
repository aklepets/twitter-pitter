class PostsController < ApplicationController
  before_filter :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:edit, :update, :destroy, :create, :new]

  respond_to :html, :json

  def index
    @posts = Post.order('updated_at DESC')

  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.save
    respond_with(@post)
  end

  def update
    @post.update_attributes(params[:post])
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  def user_posts
    @posts = Post.order('created_at DESC').select { |user_posts| user_posts.user_id == current_user.id }
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end
