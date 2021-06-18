class RoomsController < ApplicationController
  
  before_action :authenticate_user!, only: [:posts,:new,:create]
  
  
  
  def posts
    @rooms = Room.where(user_id: current_user.id)
  end
  
  
  def show
    @room = Room.find(params[:id])
    @user = User.find(@room.user_id)
    @reservation = Reservation.new
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @user = current_user
    @room = @user.room.build(room_params)
    if @room.save
      redirect_to "/rooms/#{@room.id}"
    else
      render 'rooms/new'
    end
  end
  
  private
  
    def room_params
      params.require(:room).permit(:room_name,:room_introduction,:fee,:address,:room_img)
    end
end
