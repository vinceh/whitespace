class SeedsController < ApplicationController
  protect_from_forgery
  
  before_filter :authed, :except => [:clicked]
  
  def new
  	@seed = Seed.new
  	
  	if request.post?
  		@seed = Seed.new(params[:seed])
  		
  		if @seed.mediatype == "photo" && params[:seed][:thumbnail] == ""
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
  
  def clicked

	@seed = Seed.find(params[:id])
	@seed.clicks = @seed.clicks + 1
	@seed.save

	respond_to do |format|
		# format.html {redirect_to :controller => :admins, :action => :controlpanel}
		format.js
	end
  end
end
