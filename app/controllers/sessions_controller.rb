class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user == nil
      flash[:error] = "User Could Not be Found"
      redirect_to login_path
    else
		  if @user.password == params[:session][:password]
				session[:user_id] = @user.id
				redirect_to @user
			else
				flash[:error] = "Username or Password is incorrect"
				redirect_to login_path
			end
	  end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
