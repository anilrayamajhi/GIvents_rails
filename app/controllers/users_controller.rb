class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  before_filter :authorize, only: [:edit, :edit]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    @user.save
      session[:user_id] = @user.id
      redirect_to root_path(@user)

  end

  def edit
  end

  def update
  end

  def destroy
    end

  def find_user
    @user = User.find_by_name(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo)
  end
end
