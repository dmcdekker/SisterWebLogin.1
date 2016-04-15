class UsersController < ApplicationController
 
    skip_before_filter :set_current_user, :authorize, :except => [:index]   
    
    def index
     @users = User.all
    end
    
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end 

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      log_in @user
      flash[:success] = "Welcome to SisterWeb!"
      redirect_to @user
    else
      render 'new'
    end
  end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :school_or_workplace, :technical_expertise, :still_learning)
    end
end
