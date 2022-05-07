class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to user_post_path(@comment.post.author_id, @comment.post.id)
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:Text, :author_id, :post_id)
  end
end
