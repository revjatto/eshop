class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :history]
    
  def new
      @user = User.new
  end
  
  def show
    @user = current_user
  end
  
  def create
      @user = User.new(user_params)
  if @user.save
    
      redirect_to products_path, notice: 'Welcome, please login'
  else
      render action: :new
  end
  end
  
  def history
    @purchases = current_user.purchases.includes(:product)
  end
  
  protected
  
  def user_params
      params.require(:user).permit(:name, :email, :password)
  end
  
end