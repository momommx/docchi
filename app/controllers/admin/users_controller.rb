class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to admin_users_path(@user)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :is_deleted) 
  end  
  
end
