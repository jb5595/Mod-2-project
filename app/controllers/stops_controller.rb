class StopsController < ApplicationController

  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @stop = Stop.new
    @destination = @stop.build_destination
  end

  def create
    byebug
  end


  private

  def stop_params
  end
end
