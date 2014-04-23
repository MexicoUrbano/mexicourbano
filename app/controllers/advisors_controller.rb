class AdvisorsController < ApplicationController
  def new
    @advisor = Advisor.build
  end
  def create
    @advisor = Advisor.build(advisor_params)
    if @advisor.save
      redirect_to @advisor, notice: "Asesor creado exitosamente"
    else
      render :new
    end
  end
  def show
    @advisor = Advisor.find(params[:id])
  end
  def index
    @advisors = Advisor.page(params[:page]).per_page(30)
  end
  def edit
    @trooper = Trooper.find(params[:id])
  end
  def update
    @trooper = Trooper.find(params[:id])
    if @trooper.update_attributes(advisor_params)
      redirect_to @trooper, notice: "Se ha registrado la modificación"
    else
      render :edit
    end
  end
  def destroy
    Advisor.find(params[:id]).destroy
    redirect_to advisors_path, notice: "Se ha eliminado el asesor"
  end

  private

  def advisor_params
    params.require(:advisor).permit()
  end
end
