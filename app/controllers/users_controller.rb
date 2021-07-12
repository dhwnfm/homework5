class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new(user_params)
    if @user.save
    flash[:notice] = "登録しました"
    redirect_to :user_session
    else
    render "new"
    end
  end
  
  
  private
  def user_params
    params.permit(:name)
  end
end

