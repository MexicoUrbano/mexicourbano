class KidsController < ApplicationController
  load_and_authorize_resource
  def new
    @kid = Kid.new
  end
  def create
    @kid = Kid.create(kid_params)
    if @kid.save
      redirect_to @kid, notice: "Niño creado exitosamente"
    else
      render :new
    end
  end
  def show
    @kid = Kid.find(params[:id])
  end
  def index
    if can? :destroy, Kid
      @kids = Kid.all
    else #ONLY the trooper can't remove kids
      @kids = Kid.where(:trooper_id=>current_user.userable_id)
    end
  end
  def edit
    @kid = Kid.find(params[:id])
  end
  def update
    @kid = Kid.find(params[:id])
    if @kid.update_attributes(kid_params)
      redirect_to @kid, notice: "Se ha registrado la modificación"
    else
      render :edit
    end
  end
  def destroy
    Kid.find(params[:id]).destroy
    redirect_to kid_path, notice: "Se ha eliminado el niño"
  end

  private

  def kid_params
    params.require(:kid).permit(:image, :name, :birthdate, :grade, :trooper_id)
  end
end
