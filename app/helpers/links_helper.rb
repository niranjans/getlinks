module LinksHelper
	def require_permission
	    if current_user != User.friendly.find(params[:username])
	      redirect_to root_path, :flash => { :alert => "You are not authorized."}
	    end
  	end
end
