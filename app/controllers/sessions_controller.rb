class SessionsController < ApplicationController
    layout "no_nav"

  def new
  end

  def create
    
    @user = User.find_by(user_name: params[:user_name])
    if !@user.nil? &&  @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_feed_path
    else
      flash[:notice] = "Username or Password is Incorrect"
      render :new
    end
  end

  def destroy
   session.delete :user_id
   redirect_to root_path
  end

end
