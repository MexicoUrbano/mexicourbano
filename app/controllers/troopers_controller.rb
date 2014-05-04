class TroopersController < ApplicationController
  load_and_authorize_resource
  def new
    @trooper = Trooper.new
  end
  def create
    @trooper = Trooper.create(trooper_params)
    if @trooper.save
      redirect_to @trooper, notice: "Brigadista creado exitosamente"
    else
      render :new
    end
  end
  def show
    @trooper = Trooper.find(params[:id])
  end
  def index
    @troopers = Trooper.all
  end
  def edit
    @trooper = Trooper.find(params[:id])
  end
  def update
    @trooper = Trooper.find(params[:id])
    if @trooper.update_attributes(trooper_params)
      redirect_to @trooper, notice: "Se ha registrado la modificación"
    else
      render :edit
    end
  end
  def destroy
    Trooper.find(params[:id]).destroy
    redirect_to troopers_path, notice: "Se ha eliminado el brigadista"
  end

  private

  def trooper_params
    params.require(:trooper).permit(:name, :student_number, :semester, :email, :password_temp, :password, :password_confirmation, :advisor_id, :kid_ids => [])
  end
end
