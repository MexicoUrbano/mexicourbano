class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  #Can-Can fix for Strong parameters in rails 4
  before_filter do
    resource = controller_path.singularize.gsub('/', '_').to_sym
    method = "#{resource}_params"
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  #Can-Can access denied redirect
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
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
