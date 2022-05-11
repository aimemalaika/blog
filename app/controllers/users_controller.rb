class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end

  # def user_params
  #   params.require(:user).permit(:Name, :Photo, :Bio)
  # end
end
