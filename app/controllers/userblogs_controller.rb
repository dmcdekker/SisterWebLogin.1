class UserblogsController < ApplicationController

  def index
    @userblogs = User.find(params[:user_id]).userblogs 
    #raise params.inspect
    @user = User.find(params[:user_id])
    # raise @user.inspect 
  end

  def show
    #raise params.inspect
    @userblog = Userblog.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    #raise params.inspect
    @user = User.find(params[:user_id])
  end

  def edit
    @userblog = Userblog.find(params[:id])
  end


  def create
    #raise params.inspect
    #@userblog = params[:userblog]
    #raise @userblog.inspect
    @userblog = Userblog.new(params[:userblog])
    @userblog.save
    redirect_to user_userblog_path(@userblog.user_id,@userblog.id), notice: 'Userblog was successfully created.' 
  end

  def update
    # raise params.inspect
    @userblog = Userblog.find(params[:id])
    @userblog.update_attributes(params[:userblog])
    redirect_to user_userblog_path(@userblog.user_id,@userblog.id), notice: 'Userblog was successfully updated.' 
  end

  def destroy
    @userblog = Userblog.find(params[:id])
    @userblog.destroy
    redirect_to user_userblogs_path 
  end
end