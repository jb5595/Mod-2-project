class ItinerariesController < ApplicationController

  def index
    if  params[:search]
      @itineraries = Itinerary.filter_by_destination(params[:search])
    elsif params[:sort] == "Most Recent"
      @itineraries = Itinerary.most_recent
    elsif params[:sort] == "User"
      @itineraries = Itinerary.sort_by_user
    elsif params[:sort] == "Budget"
      @itineraries = Itinerary.sort_by_budget
    else
      @itineraries = Itinerary.all
    end
  end

  def new
    @itinerary = current_user.itineraries.build
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to new_itinerary_destination_path(@itinerary)
    else
      render :new
    end
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update(itinerary_params)
      redirect_to(session[:return_to])
    else
      render :edit
    end

  end

  def edit
    session[:return_to] = request.referer
    @itinerary = Itinerary.find(params[:id])
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def like
    session[:return_to] = request.referer
    @itinerary = Itinerary.find(params[:id])
    @itinerary.likes += 1
    @itinerary.save
    redirect_to(session[:return_to])
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:name, :duration, :budget_category,:user_id,
      destinations_attributes: [
        :name, :duration, :description
      ]
    )
  end

end
