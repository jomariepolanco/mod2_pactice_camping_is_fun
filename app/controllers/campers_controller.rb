class CampersController < ApplicationController
  before_action :set_camper, only: [:show]
  
  def index
    @campers = Camper.all
  end

  def show
    render :show 
  end

  def new
    @camper = Camper.new 
    render :new 
  end

  def create
    @camper = Camper.create(camper_params)
    if @camper.valid?
        redirect_to camper_path(@camper)
    else
      flash[:camper_errors] = @camper.errors.full_messages
      redirect_to new_camper_path
    end
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :age)
  end

  def set_camper
    @camper = Camper.find(params[:id])
  end

end
