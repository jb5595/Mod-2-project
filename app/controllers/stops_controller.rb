class StopsController < ApplicationController



  def new
    @stop = Stop.new
  end

  def create
    byebug
    @stop = Stop.create(stop_params, destination_id: 1, itinerary_id:1)
    redirect_to stop_path(@stop)
  end
  def show
    @stop = Stop.find(params[:id])
  end



  private

  def stop_params
    params.require(:stop).permit(:description, :image_url)
  end
end
