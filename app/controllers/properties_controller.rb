class PropertiesController < ApplicationController
  before_action :authenticate_user! 
  
  def index
   
    @properties = current_user.properties
  end
  def show
    @property = Property.find(params[:id])
  end
  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.build(property_params)

    if @property.save
      redirect_to properties_path, notice: 'Property added successfully!'
    else
      flash.now[:alert] = 'Failed to add property.'
      render :new
    end
  end

  private

  def property_params
   
    params.require(:property).permit(:name, :description, :price, :location,:image)
  end
end
