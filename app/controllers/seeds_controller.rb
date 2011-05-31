class SeedsController < ApplicationController
  protect_from_forgery
  
  before_filter :authed
  
  def new
  	@seed = Seed.new
  	
  	if request.post?
  		@seed = Seed.new(params[:seed])
  		if @seed.save
  			flash[:message] = "Seed successfully created"
  			redirect_to :controller => :admins, :action => :controlpanel
  		end
  	end
  end
end
