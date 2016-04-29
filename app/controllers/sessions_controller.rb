class SessionsController < ApplicationController
skip_before_filter :set_current_user, :authorize 
    # creates a new user with the 3rd party auth via Twitter
  
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    
    redirect_to root_path
  end
  
  def destroy
    session.delete(:user_id)
    #flash[:notice] = 'Logged out successfully.'
    redirect_to '/login', notice: 'Logged out successfully'
  end
  
  # new just presents the user with a nice view
  def new
    #user wants to log in 
  end 
  
  def find    
    #user = User.find_by_email(params[:user][:email]) || User.find_by(penname: params[:user][:penname])
    begin
      if params[:permission][:name].include? '@'
        user = User.find_by(email: params[:permission][:name])
      else
        user = User.find_by(penname: params[:permission][:name])
      end
    rescue 
      flash[:alert] = 'Invalid login credentials.'
      redirect_to '/login'
    end
    
    # user.authenticate calls bcrypt to check if email and passwrd match a db entry
    if user && user.authenticate(params[:user][:password])
      # after we log in a user, we set their id, because we need it for before_filter
      session[:user_id] = user.id
      
      session[:provider] = nil   
      flash[:notice] = "Welcome, #{user.penname}!" 
      redirect_to root_path 
    else
      flash[:alert] = "Invalid login credentials." 
      redirect_to '/login'
    end    

  end 
  
  def failure
    flash[:notice] = "Sorry, you must signup for access"
  end
  
end