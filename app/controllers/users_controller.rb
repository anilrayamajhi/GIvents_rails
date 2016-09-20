class UsersController < ApplicationController
  before_action :authorize, only: [:show, :edit]
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id] = user.id
        redirect_to root_path(@user)
      end
  end

  def edit
  end

  def update
  end

  def destroy
      @user.destroy
      redirect_to events_path
    end

  def find_event
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
