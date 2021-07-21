class MypagesController < ApplicationController
  def new
    @mypage = Mypage.new
  end

  def index
    @mypage = Mypage.all
  end
  
  def show 
    @mypages = Mypage.all
  end
  
  
  def create
    @mypage = Mypage.new(params.require(:mypage).permit( :id, :user_id, :username, :introduction, :img ))
    @mypage.user_id = current_user.id 
   
    if @mypage.save
    flash[:notice] = "mypage !"
    redirect_to :user_session
    else
    render "new"
    end
  end
  
  def edit
    @mypage = Mypage.find(params[:id])
  end  
  
  def update
    @mypage = Mypage.find(params[:id])
    if @mypage.update(params.require(:mypage).permit(:username, :introduction, :img ))
    flash[:notice] = "ユーザーIDがの情報を更新しました"
    redirect_to :user_session
    else
    render "edit"
    end
  end
  
  def destroy
   @mypage = Mypage.find(params[:id])
   @mypage.destroy
   flash[:notice] = "削除しました"
   redirect_to :user_session
  end
end
