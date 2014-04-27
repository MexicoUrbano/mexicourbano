class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def landing
      if user_signed_in?
        redirect_to_user
      else
        redirect_to new_user_session_path
      end
  end
  
  
  private
    # Redirecciona al URL del tipo de usuario
    # Ej:
    # /advisor/1
    # /trooper/23
    # /admin/1
    def redirect_to_user
      eval "redirect_to #{current_user.userable_type.downcase}_path(current_user.userable_id)"
    end
end
