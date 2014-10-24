module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def auth_user
    unless user_signed_in?
      flash[:alert] = 'You need to be signed in before continuing.'
      redirect_to session.delete(:return_to)
    end
  end
  
end
