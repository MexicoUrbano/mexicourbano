e  load_and_authorize_resource
  def new
    @advisor = Advisor.new
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
    @advisor = Advisor.find(params[:id])
  end
  def update
    @advisor = Advisor.find(params[:id])
    if @advisor.update_attributes(advisor_params)
      redirect_to @advisor, notice: "Se ha registrado la modificación"
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
    params.require(:advisor).permit(:name, :email, :password, :password_confirmation)
  end
end
