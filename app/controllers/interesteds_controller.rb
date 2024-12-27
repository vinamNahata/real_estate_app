class InterestedsController < ApplicationController
    before_action :authenticate_user!
  
   
    def create
      # Ensure the user is not adding the same property twice
      interested = Interested.find_or_initialize_by(user: current_user, property_id: params[:property_id])
  
      if interested.new_record? && interested.save
        redirect_to property_path(params[:property_id]), notice: "Property added to your interests."
      else
        redirect_to property_path(params[:property_id]), alert: "Could not add property to your interests."
      end
    end
    
  end
  