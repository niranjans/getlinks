class UsersController < ApplicationController
  include ApplicationHelper
  
  respond_to :html, :js

  before_filter :auth_user, :only => [:update]

  def show
  	@user = User.friendly.find(params[:username])
    session[:return_to] ||= request.referer
  end

  def update
  	@user = User.friendly.find(params[:username])
  	@user.update_attributes(user_params)
	
	respond_to do |format|
	    format.html { redirect_to @user }
	    format.js
  	end
  end


  def check_username
  	if User.where('lower(username) = ?', params[:username].downcase).count == 0
  		render json: true, status: 200
  	else
  		render json: false, status: 400
  	end
  end

  private 

  def user_params
  	params.require(:user).permit(:name, :short_bio, :avatar)
  end
end
