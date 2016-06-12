class AdicionalServicesController < ApplicationController
  before_filter :authenticate_user!
  def index
    @adicional_services = AdicionalService.all
  end

  def new
    @adicional_service = AdicionalService.new
  end
  
  def show
    @adicional_service = AdicionalService.find(params[:id])
  end

  def create
    adicional_service = AdicionalService.new(params_adicional_service)
    adicional_service.save
    redirect_to :action => :index
  end

  def edit
    @adicional_service = AdicionalService.find(params[:id])
  end

  def update
    adicional_service = AdicionalService.find(params[:id]).update_attributes(params_adicional_service)
    redirect_to :action => :index
  end

  def destroy
    adicional_service = AdicionalService.destroy(params[:id])
    redirect_to :action => :index
  end

  private
  def params_adicional_service
    params.require(:adicional_service).permit(
      :name, :cost
    )
  end
end
