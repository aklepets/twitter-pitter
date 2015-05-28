class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update, :destroy, :create]

  respond_to :html, :json

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save

    redirect_to @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
