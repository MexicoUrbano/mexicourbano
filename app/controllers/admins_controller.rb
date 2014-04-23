class AdminsController < ApplicationController
  load_and_authorize_resource
  def show
    @admin = Admin.find(params[:id])
  end
end
