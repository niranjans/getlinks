class LinksController < ApplicationController
  respond_to :html, :js

  def new
  	@new_link = Link.new
  end

  def create
  	@link = Link.new(link_params)
  	@link.user = current_user
  	@link.save
    @links = current_user.links
  end

  def edit
  end
    
    private

    def link_params
      params.require(:link).permit(:title, :url, :link_type)
    end

end