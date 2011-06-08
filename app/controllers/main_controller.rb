class MainController < ApplicationController
  protect_from_forgery
  
  def index
  	@seeds = Seed.all
  	
  	set_seed_counts(@seeds)
  end
  
  private
  
  def set_seed_counts( seeds )
  	
  	session[:seeds] = Array.new
  	seeds.each do |s|
  		session[:seeds].push([s.id, s.clicks])
  	end
  	
  	puts session[:seeds][0][1]
  end
end