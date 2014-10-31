class LinksController < ApplicationController
  respond_to :html, :js

  def new
  	@new_link = Link.new
  end

  def create
  	@link = Link.new(link_params)
  	@link.user = User.friendly.find(params[:username])
  	@link.save
    @links = @link.user.links
  end

  def edit
  end

  def destroy
    @link = Link.find(params[:id])
    @deletedLinkId = @link.id
    @link.destroy
  end
    
    private

    def link_params
      params.require(:link).permit(:title, :url, :link_type)
    end

end
