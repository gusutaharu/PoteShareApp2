class ReservationsController < ApplicationController
 
  
  
  def index
    @reservations = Reservation.all
    
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
  end
  
  def confirm
     @reservation = current_user.reservations.build(reservation_params)
     @room = Room.find(@reservation.room_id)
     @user = User.find(@room.user_id)
     render "rooms/show" if @reservation.invalid?
  end
  
  
  def create
   
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      flash[:notice] = "Reservation was successfully created."
      redirect_to "/reservations/#{@reservation.id}"
    else
      
      render "rooms/show"
    end
  end
  
  def destroy
    @reservations = Reservation.all
    @reservations.destroy
    @reservations.save
  end


  private
    
    def reservation_params
      params.require(:reservation).permit(:start_date,:end_date,:number_of_people,:room_id)
    end
    
    

end