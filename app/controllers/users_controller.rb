class UsersController < ApplicationController
  def show
  	@user = User.friendly.find(params[:id])
  	#@user = User.friendly.find_by_slug(params[:id])
  end


end
