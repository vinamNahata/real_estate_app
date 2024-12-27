class PropertiesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  
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
  def destroy
    @property = current_user.properties.find(params[:id])  # Ensure the property belongs to the current user
    if @property.destroy
      redirect_to properties_path, notice: 'Property deleted successfully!'
    else
      redirect_to properties_path, alert: 'Failed to delete the property.'
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :description, :price, :location, images: [])
  end
end
