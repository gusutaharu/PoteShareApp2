class ReservationsController < ApplicationController
 
 before_action :authenticate_user!, only: [:index,:confirm,:create]
  
  
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
     
     if @reservation.invalid?
       redirect_to "/rooms/#{@room.id}"
     elsif @reservation.start_date < Date.today
       flash[:alert] = "過去の日付は使用できません"
       redirect_to "/rooms/#{@room.id}"
     elsif @reservation.end_date < @reservation.start_date
       flash[:alert] = "終了日は開始日より後にしてください"
       redirect_to "/rooms/#{@room.id}"
     end
     
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


  private
    
    def reservation_params
      params.require(:reservation).permit(:start_date,:end_date,:number_of_people,:room_id)
    end
    
    

end
