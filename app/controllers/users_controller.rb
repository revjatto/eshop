class UsersController < ApplicationController
  def new
      @user = User.new
  end
  
  def create
      @user = User.new(user_params)
  if @user.save
    flash[:notice] = 'Welcome, please login'
      redirect_to products_path
  else
      render action: :new
  end
  end
  
  protected
  
  def user_params
      params.require(:user).permit(:name, :email, :password)
  end
  
  
end