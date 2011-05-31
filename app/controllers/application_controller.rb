class ApplicationController < ActionController::Base
	
  protect_from_forgery
  
  def authed
  	return true if !session[:admin].nil?
  	redirect_to :controller => :main
  	return false
  end
end
