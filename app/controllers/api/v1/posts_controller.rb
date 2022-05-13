class Api::V1::PostsController < Api::V1::BaseController
  # GET /posts
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments, :likes).order(created_at: :desc)
    render json: @posts, status: 200
  end

  # GET /posts/{username}
  def show
    @post = Post.find(params[:id])
    render json: @post, status: 200
  end
end
