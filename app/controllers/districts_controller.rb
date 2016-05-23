class DistrictsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @districts = District.all
  end

  def new
    @district = District.new
  end

  def create
    district = District.new(params_district)
    district.save
    redirect_to :action => :index
  end

  def edit
    @district = District.find(params[:id])
  end

  def update
    district = District.find(params[:id]).update_attributes(params_district)
    redirect_to :action => :index
  end

  def destroy
    district = District.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_district
    params.require(:district).permit(
      :name
    )
  end
end
