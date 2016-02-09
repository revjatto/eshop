class SessionsController < ApplicationController
  def create
    email, password = session_params.values_at(:email, :password)
    
    if user = User.authenticate(email, password)
      session[:user_id] = user.id
      redirect_to products_path
    else
     redirect_to products_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to products_path
  end
  
  protected
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
