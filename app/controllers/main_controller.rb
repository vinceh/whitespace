class MainController < ApplicationController
  protect_from_forgery
  
  def index
  	@seeds = Seed.all
  	@comment = Comment.new
  	
  	set_seed_counts(@seeds)
  end
  
  def check
  	
	@seeds = Array.new

	session[:seeds].each do |id, clicks|
		seed = Seed.find(id)

		if seed.clicks.to_i > clicks
			@seeds.push(seed.id)
			session[:seeds][id] = seed.clicks
		end
	end
		
  	respond_to do |format|
  		format.js { render "main/check" }
  	end
  end
  
  def seed_detail  	
  	
  	@seed = Seed.find(params[:id])
  	@comment = Comment.new
  	@comments = Comment.find_all_by_seed_id(params[:id])
  	@comments = @comments.reverse
  	
  	respond_to do |format|
  		format.js { render "seeds/detail" }
  	end
  end
  	
  def feed
  	
  	@seed = Seed.find(params[:id])
  	@seed.clicks = @seed.clicks + 1
  	@seed.save
  	
  	respond_to do |format|
  		format.js { render "seeds/fed" }
  	end
  end
  	
  private
  
  def set_seed_counts( seeds )
  	
  	session[:seeds] = Hash.new
  	seeds.each do |s|
  		session[:seeds][s.id] = s.clicks
  	end
  end
end