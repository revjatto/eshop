class SessionsController < ApplicationController
  def create
    email, password = session_params.values_at(:email, :password)
    
    if user = User.authenticate(email, password)
      session[:user_id] = user.id
      redirect_to products_path, notice: "Welcome, #{user.name}"
    else
     redirect_to products_path, notice: 'Invalid email or password, try again'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, alert: 'Goodbye, come shop with us again'
  end
  
  protected
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
  
 
end
