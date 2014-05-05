class ReportsController < ApplicationController
  def index
    if current_user.admin?
      @reports = Report.all
    elsif current_user.advisor?
       @reports = Report.where(kid_id: Kid.where(trooper_id: current_user.troopers.pluck(:id)).pluck(:id))
    elsif current_user.trooper?
      @reports = Report.where(kid_id: current_user.kids.pluck(:id))
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
    if @report.update_attributes(report_params)
      redirect_to @report, notice: "Se ha registrado la modificación"
    else
      render :edit
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def destroy
    Report.find(params[:id]).destroy
    redirect_to reports_path, notice: "Se ha eliminado el reporte"
  end

  def create
    if current_user.trooper?
      @report = current_user.new(report_params)
    else
      @report = Report.new(report_params)
    end

    if @report.save
      redirect_to @report, notice: "Reporte creado exitosamente"
    else
      render :new
    end
  end

  def new
    if current_user.trooper?
      @report = current_user.new
    else
      @report = Report.new
    end
  end

  private

  def report_params
    params.require(:report).permit(:assistance, :general_observations, :grade, :kid_id, :week, :activities_attributes => [:id, :objective, :grade, :observation, :_destroy] )
  end
end
