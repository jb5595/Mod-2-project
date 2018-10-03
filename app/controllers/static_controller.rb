class StaticController < ApplicationController

  def home
    if session[:user_id]
      redirect_to user_feed_path
    else
      render :layout => "no_nav"
    end
  end
end
