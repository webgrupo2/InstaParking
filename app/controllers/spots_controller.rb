class SpotsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @spots = Spot.all
  end
  
  def show
    @spot = Spot.find(params[:id])
  end

  def new
    @spot = Spot.new
    @districts = District.all
  end

  def create
    spot = Spot.new(params_spot)
    spot.user_id = current_user.id
    spot.save
    redirect_to :action => :index
  end

  def edit
    @districts = District.all
    @spot = Spot.find(params[:id])
  end

  def update
    spot = Spot.find(params[:id]).update_attributes(params_spot)
    redirect_to :action => :index
  end

  def destroy
    spot = Spot.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_spot
    params.require(:spot).permit(
      :user_id, :district_id, :cost, :description, :address, :photo
    )
  end
end