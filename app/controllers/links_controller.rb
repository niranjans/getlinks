class LinksController < ApplicationController
  include ApplicationHelper
  include LinksHelper
  
  respond_to :html, :js
  before_filter :auth_user
  before_filter :require_permission

  def new
  	@new_link = Link.new
  end

  def create
  	@link = Link.new(link_params)
  	@link.user = User.friendly.find(params[:username])
  	@link.save
    @links = @link.user.links.order("position")
  end

  def edit
  end

  def destroy
    @link = Link.find(params[:id])
    @deletedLinkId = @link.id
    @link.destroy
  end

  def sort
    params[:link].each_with_index do |id, index|
      Link.where(id: id).update_all({position: index+1})
    end

    render nothing: true
  end
    
    private

    def link_params
      params.require(:link).permit(:title, :url, :link_type)
    end

end
