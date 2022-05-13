class Api::V1::UsersController < Api::V1::BaseController
  def index
    render json: User.all, status: :ok
  end

  def show
    render json: User.find(params[:id])
  end
end
