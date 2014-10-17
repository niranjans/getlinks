class UsersController < ApplicationController
  def show
  	@user = User.friendly.find(params[:username])
  	#@user = User.friendly.find_by_slug(params[:id])
  end

  def check_username
  	if User.where('lower(username) = ?', params[:username].downcase).count == 0
  		render json: true, status: 200
  	else
  		render json: false, status: 400
  	end
  end
end
