class CommentsController < ApplicationController
  def index
    #raise params.to_yaml

    @comments = Userblog.find(params[:userblog_id]).comments
    @userblog = Userblog.find(params[:userblog_id]) 
    
  end

  def show
    @comment = Comment.find(params[:id])
    
  end

  def new
    @userblog = Userblog.find(params[:userblog_id]) 
    
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    #raise params.to_yaml 
    @comment = Comment.new(params[:comment])
    
    @comment.save
    redirect_to user_userblog_path(@comment.userblog.user_id, @comment.userblog_id)
  
  end


  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    #redirect_to user_userblog_path(@comment.userblog.user_id, @comment.userblog_id)
    redirect_to userblog_comment_path(@comment.userblog_id,@comment.id), notice: 'Userblog was successfully updated.' 
  end

 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
