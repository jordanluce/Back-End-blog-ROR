class Admin::CommentsController < Admin::ApplicationController
  def index
  	if params[:search].present?
  		@comments = Comment.matching_fullname_or_message(params[:search]).page params[:page]
  	else
  		@comments = Comment.where(status: ActiveRecord::Type::Boolean.new.deserialize(params[:status])).page params[:page]
  	end
  end

  def update
  	@comments = Comment.find(params[:id])
  	if @comments.update(status: params[:status])
  	redirect_to :back, notice: 'Successfully updated comment'

    else redirect_to :back, notice: 'There was a problem updating comment'
    end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  	redirect_to :back, notice: 'Comment successfully deleted'
  end

  
end
