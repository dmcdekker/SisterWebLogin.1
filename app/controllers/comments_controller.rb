class CommentsController < ApplicationController
  before_filter :has_user, :only => [:new, :create]
  protected
  def has_user
    unless @current_user
      flash[:warning] = 'You must be logged in to comment.'
      #redirect_to '/auth/twitter'
    end
    unless (@user = User.find_by_id(params[:user_id]))
      flash[:warning] = 'Comment must be for a profile.'
      redirect_to 'staticpages/home'
    end
  end
  public
  def new
    @comment = @user.comment.build
  end
  def create
    # since moviegoer_id is a protected attribute that won't get
    # assigned by the mass-assignment from params[:review], we set it
    # by using the << method on the association.  We could also
    # set it manually with review.moviegoer = @current_user.
    @current_user.comments << @user.comments.build(params[:comment])
    redirect_to user_path(@user)
  end
end