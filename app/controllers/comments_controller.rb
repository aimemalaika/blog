class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      flash[:success] = 'Comment was saved'
      redirect_to user_post_path(@comment.post.author_id, @comment.post.id)
    else
      flash[:error] = 'Failed to add comment'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@comment.post.author_id, @comment.post.id)
  end

  def comment_params
    params.require(:comment).permit(:Text, :post_id)
  end
end
