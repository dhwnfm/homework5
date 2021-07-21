class RoomsController < ApplicationController
  
  before_action :set_q, only: [:index, :search]
  def new
    @room = Room.new 
    @room.images.build
  end

  def index
    @rooms = Room.all
  end

  def show
    @rooms = current_user.rooms.all
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
		  Reservation.create!(reservation_params)
	 end
 
 
  def create
    @room = Room.new(params.require(:room).permit(:name, :introduction, :price, :address, :user_id, images_attributes: [:image_url]))
    @room.user_id = current_user.id # user_idの情報はフォームからはきていないので、deviseのメソッドを使って「ログインしている自分のid」を代入
    if @room.save
    flash[:notice] = "ルームを新規登録しました"
    redirect_to :user_session
    else
    render "new"
    end
  end
  
  def edit
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  
  end
  
  def check
    @reservations = Reservation.where( user_id:current_user.id )
    @rooms = Room.all
  end  
  
  def search
    @results = @q.result
  end  
  
  
  
  def destroy
   @room = Room.find(params[:id])
   @room.destroy
   flash[:notice] = "削除しました"
   redirect_to :rooms
  end
    
  private
  
  def set_q
    @q = Room.ransack(params[:q])
  end
  
  def reservation_params
	  	params.require(:reservation).permit(:user_id, :room_id, :start_date, :end_date, :people )
	end   

end
