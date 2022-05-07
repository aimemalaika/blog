class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:author_id, :Title, :Text)
  end
end
