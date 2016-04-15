class CommentsController < ApplicationController

  def index
    @comments = Comment.find_all_by_user_id(params[:user_id]) 
    #raise params.inspect
    @user = User.find(params[:user_id])
    # raise @user.inspect 
  end

  def show
    #raise params.inspect
    @comment = Comment.find(params[:id])
    @user = User.find(params[:user_id])
  end

#def new
    #raise params.inspect
    #@comment = @user.comments.build
  #end

  def new
    #@user = User.find(params[:user_id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end


  def create
    #raise params.inspect
    @user = params[:comment]
    #raise @userblog.inspect
    @comment = Comment.new(params[:comment])
    @comment.save
    #redirect_to user_path(@user)
    redirect_to user_comment_path(@comment.user_id,@comment.id), notice: 'Comment was successfully created.'
    #redirect_to :root
  end
    
    
    #redirect_to user_comment_path(@comment.user_id,@comment.id), notice: 'Comment was successfully created.' 
  #end
  
  #def create
    # since moviegoer_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.
    #@current_user.comments << @user.comments.build(params[:comment])
    #redirect_to user_path(user)
  #end

  def update
    # raise params.inspect
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to user_comment_path(@comment.user_id,@comment.id), notice: 'Comment was successfully updated.' 
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_comments_path 
  end
end