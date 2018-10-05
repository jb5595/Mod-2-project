class DestinationsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @destination = Destination.new
  end

  def create
    @itinerary =  Itinerary.find(params[:destination][:itinerary_id])
    @destination = Destination.new(destination_params)
    if @destination.save
      @itinerary.destinations << @destination
      redirect_to new_itinerary_destination_path(@itinerary)
    else
      render :new
    end
  end

  def edit
    session[:return_to] = request.referer
    @destination = Destination.find(params[:id])
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination.update(destination_params)
      redirect_to(session[:return_to])
    else
      render :edit
    end

  end

  def destroy
    session[:return_to] = request.referer
    Destination.destroy(params[:id])
    Stop.find_by(destination_id: params[:id]).destroy
    redirect_to(session[:return_to])
  end


  private

  def destination_params
    params.require(:destination).permit(:name, :description, :region, :picture_url)
  end
end
