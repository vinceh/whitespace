class MainController < ApplicationController
  protect_from_forgery
  
  def index
  	@seeds = Seed.all
  end
end
