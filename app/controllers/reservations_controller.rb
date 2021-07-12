class ReservationsController < ApplicationController
  def index
   @reservation = Reservation.all
  end

  def new
   @room = Room.new
   @reservation = Reservation.new 
  end

  def create
   @reservation = Reservation.new(params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :people ))
   @reservation.user_id = current_user.id 

    if @reservation.save
    flash[:notice] = "ルーム新規予約しました"
    redirect_to :user_session
    else
    render "new"
    end  
  end

  def show
   @reservations = current_user.reservations.all
   @rooms = current_user.rooms.all
  end
   
 

  def destroy
   @reservation = Reservation.find(params[:id])
   @reservation.destroy
   flash[:notice] = "削除しました"
   redirect_to :user_session
  end
end
