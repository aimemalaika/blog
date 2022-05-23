class Api::V1::LikesController < Api::V1::BaseController
  def create
    @post = Post.find(params[:post_id])
    @new_like = current_user.likes.new
    @new_like.post_id = @post.id
    @new_like.save
    flash[:success] = 'Liked Post'
    redirect_to user_post_path(@post.author_id, @post.id)
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
