class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_userName(params[:userName])

    if user && user.authenticate(params[:password])
    	puts("AUTHENTICATED")
      session[:user_id] = user.id
      session[:username] = user.userName
      redirect_to '/overview/index'
    else
    	puts("NOT AUTHENTICATED")
      flash[:error] = "Invalid username or password"
      redirect_to '/login'
    end
  end

  def destroy
  	session[:user_id] = nil
    redirect_to '/login'
  end
end
