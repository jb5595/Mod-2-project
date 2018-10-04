class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    render :layout => "no_nav"
  end

  def create

    @user = User.new(user_params)
    if @user.save
      byebug
      session[:user_id] = @user.id
      redirect_to user_feed_path
    else

      render :new, :layout => "no_nav"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def feed

    @user = current_user
    if params[:search]
      @itineraries = @user.feed_filtered_by_destination(params[:search])
    elsif params[:sort] == "Most Recent"
      @itineraries = @user.feed_ordered_by_most_recent
    elsif params[:sort] == "Budget"
      @itineraries = @user.feed_ordered_by_budget
    elsif params[:sort] == "User"
      @itineraries = @user.feed_ordered_by_user
    else
      @itineraries = @user.feed
    end
  end

  def follow
    session[:return_to] = request.referer
    current_user.follow(User.find(params[:id]))
    redirect_to(session[:return_to])
  end


  def unfollow
    session[:return_to] = request.referer
    current_user.unfollow(User.find(params[:id]))
    redirect_to(session[:return_to])
  end

  def add_to_wish_list
    session[:return_to] = request.referer
    current_user.wishlist<<(Itinerary.find(params[:itinerary_id]))
    redirect_to(session[:return_to])
  end
  def remove_from_wish_list
    session[:return_to] = request.referer
    current_user.wishlist.delete(Itinerary.find(params[:itinerary_id]))
    redirect_to(session[:return_to])
  end

  def wishlist
    @itineraries = current_user.wishlist
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :first_name, :last_name,:password_confirmation,:password ,:bio, :thumbnail)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
