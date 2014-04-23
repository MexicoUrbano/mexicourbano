class TroopersController < ApplicationController
  def new
    @trooper = Trooper.build
  end
  def create
    @trooper = Trooper.build(trooper_params)
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
    @troopers = Trooper.page(params[:page]).per_page(30)
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
    params.require(:trooper).permit()
  end
end
