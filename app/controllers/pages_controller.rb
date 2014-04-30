class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def landing
      if user_signed_in?
        redirect_to dashboard_url
      else
        redirect_to new_user_session_path
      end
  end
  
end
