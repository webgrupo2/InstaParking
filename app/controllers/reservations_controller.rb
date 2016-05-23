class ReservationsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_action :verify_authenticity_token
  def index
    @reservations = Reservation.where("user_id = ?",current_user.id)
  end

  def new
    @cars = Car.where("user_id = ?",current_user.id)
    @districts = District.all
    @reservation = Reservation.new
  end

  def create
    reservation = Reservation.new(params_reservation)
    reservation.user_id = current_user.id
    reservation.status = "waiting"
    fechadereserva = params[:fecha].to_date
    reservation.start_hour = Time.new(fechadereserva.year,fechadereserva.month,fechadereserva.day, params[:horainicio][0...2], params[:horainicio][3...5], 00)
    reservation.end_hour = Time.new(fechadereserva.year,fechadereserva.month,fechadereserva.day, params[:horafin][0...2], params[:horafin][3...5], 00)
    reservation.final_cost = (((reservation.end_hour-reservation.start_hour)/3600).round(2)*Spot.find(reservation.spot_id).cost).round(2)
    reservation.save
    redirect_to :action => :index
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id]).update_attributes(params_reservation)
    redirect_to :action => :index
  end

  def destroy
    reservation = Reservation.destroy(params[:id])
    redirect_to :action => :index
  end
  
  def complete
    district = params[:district]
    @combo=Array.new
    @spots = Spot.where("district_id = ?",district)
    @spots.each do |x|
      @combo << { 'id' => x.id, 'name' => 'Direccion: ' + x.address.to_s + ' S/.' + x.cost.to_s}
    end
    render json: {:combo => @combo}
  end

  private
  def params_reservation
    params.require(:reservation).permit(
      :car_id,:spot_id,:fecha,:horainicio,:horafin
    )
  end
end
