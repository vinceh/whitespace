class SeedsController < ApplicationController
  protect_from_forgery
  
  before_filter :authed
  
  def new
  	@seed = Seed.new
  	
  	if request.post?
  		@seed = Seed.new(params[:seed])
  		
  		if @seed.type == "photo" && params[:seed][:thumbnail] == ""
  			@seed.thumbnail == @seed.content
  		end
  		
  		if @seed.save
  			flash[:message] = "Seed successfully created"
  			redirect_to :controller => :admins, :action => :controlpanel
  		end
  	end
  end
  
  def delete
  	@seed = Seed.find(params[:id])
	@seed.display = false
	
	if @seed.save
		flash[:message] = "Seed removed"
		redirect_to :controller => :admins, :action => :controlpanel
	end
  end
end
