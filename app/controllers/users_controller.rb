class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created."
      redirect_to '/login'
    else
      render 'new'
    end
  end

  def show
    @user = User.find params.require(:id)
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end
