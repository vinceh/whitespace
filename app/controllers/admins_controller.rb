class AdminsController < ActionController::Base
  protect_from_forgery
  
  def login
  	
  	if request.post?
  		admin = Admin.where(:username => params[:admin][:username]).first
  		
  		if admin != nil && check_password(admin, params[:admin][:password])
  			redirect_to :action => :controlpanel
  		else
  			redirect_to :controller => :main
  		end
  	end
  end
  
  def controlpanel
  end
  
  protected
  
  def check_password(admin, password)
  	puts "FGSDJGIDFJDIAF"
  	puts Admin.encrypt(password, admin.salt)
  	return admin.hashed_password == Admin.encrypt(password, admin.salt)
  end
end
