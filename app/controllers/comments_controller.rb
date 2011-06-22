class CommentsController < ApplicationController
  protect_from_forgery
  
  def create
  	
  	@comment = Comment.new(params[:comment])
  	@comment.save
  	
  	respond_to do |format|
  		format.js { render "seeds/create_comment" }
  	end
  end
end
