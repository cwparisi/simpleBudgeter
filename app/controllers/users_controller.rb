class UsersController < ApplicationController
  before_filter :authorize
  before_filter :authorize_admin, :except => [:edituser, :update]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to action: "index"
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  def edituser
    @user = User.find(session[:user_id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:firstName, :lastName, :userName, :password, :password_confirmation)
    end
end
