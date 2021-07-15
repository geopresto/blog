class SessionsController < ApplicationController

  def new
  end

   def create
   
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
         session[:user_id] = @user.id
         flash[:notice] = "Logged in successfully."
         redirect_to '/show'
      else
         flash.now[:alert] = "There was something wrong with your login details."
         redirect_to '/login'
      end
   end

  def login
  end

  def destroy
   session[:user_id] = nil
   flash[:notice] = "You have been logged out."
   redirect_to root_path
  end 

  def welcome
  end

  def page_requires_login
  end

  def show
  end
end
