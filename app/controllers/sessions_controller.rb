class SessionsController < ApplicationController
  def new
  	#don't have to instantiate a user object because only logging in, not creating a new user
  end

  def create
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.user_id
  		redirect_to product_url, :notice => "Logged in!"
  	else
  		flash.now[:alert] = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to product_url, :notice => "Logged out!"
  end
end
