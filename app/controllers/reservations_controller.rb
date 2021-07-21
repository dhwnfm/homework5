class ReservationsController < ApplicationController
  def index
   @reservations = Reservation.all.includes(:rooms)
  end

  def new
   @reservation = Reservation.new
  end
  

  def back
		  @reservation = Reservation.new(reservation_params)
    render :new
  end  
	 
	 def confirm
		  @reservation = Reservation.new(reservation_params)
		   if @reservation.invalid?
			   render :new
		   end
	 end
	 
	 def complete
		  @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id 
   
    if @reservation.save
    flash[:notice] = "ルーム新規予約しました"
    redirect_to :user_session
    else
    render "new"
    end  
	 end

  def create
   @reservation = Reservation.new(reservation_params)
   @reservation.user_id = current_user.id 
   
    if @reservation.save
    flash[:notice] = "ルーム新規予約しました"
    redirect_to :user_session
    else
    render "new"
    end  
  end

  def show
  
   @reservations = Reservation.where( user_id:current_user.id )
   @rooms = Room.where( user_id:current_user.id )
   
  end
   
  def destroy
   @reservation = Reservation.find(params[:id])
   @reservation.destroy
   flash[:notice] = "削除しました"
   redirect_to :user_session
  end
 
  private

	 def reservation_params
	  	params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :people )
	 end
 
end
