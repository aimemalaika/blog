class Api::V1::CommentsController < Api::V1::BaseController

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])

    render json:@post.comments, status: :ok
  end

  def create
    @comment = Comment.create(comment_params

      render json:@comment, status: :ok
  end

  def comment_params
    params.require(:comment).permit(:Text, :post_id)
  end
end
