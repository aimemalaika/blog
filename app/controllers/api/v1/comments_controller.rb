class Api::V1::CommentsController < Api::V1::BaseController
  def index
    @post = Post.find(params[:post_id])
    render json: @post.comments, status: 200
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: @comment, status: 200
    else
      render json: { error: 'Failed to add comment' }, status: 400
    end
  end

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
