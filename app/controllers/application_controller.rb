class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
 before_filter :set_current_user, :authorize, :except => [:home, :about] 
  protected # prevents method from being invoked by a route
  
  def set_current_user
    if session[:user_id]
      #if session[:provider] 
        @current_user ||= User.find(session[:user_id])
        #raise @current_user.inspect
    else
        redirect_to '/login'
    end 

  end

  def authorize
  	redirect_to '/login', alert: "Not Authorized" if session[:user_id].nil?	 	
  end 
  
  protect_from_forgery with: :exception
  include SessionsHelper
end
