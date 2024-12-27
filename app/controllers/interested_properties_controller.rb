class InterestedPropertiesController < ApplicationController
  before_action :authenticate_user!

  def index
    # Fetch properties the current user is interested in
    @interested_properties = Property.joins(:interesteds)
                                     .where(interesteds: { user_id: current_user.id })
  end

  def create
    # Add property to the user's interests
    interested = Interested.new(user: current_user, property_id: params[:property_id])
    if interested.save
      redirect_to property_path(params[:property_id]), notice: "Property added to your interests."
    else
      redirect_to property_path(params[:property_id]), alert: "Could not add property to your interests."
    end
  end

  def destroy
    # Remove property from the user's interests
    interested = Interested.find_by(user: current_user, property_id: params[:id])
    if interested&.destroy
      redirect_to interested_properties_path, notice: "Property removed from your interests."
    else
      redirect_to interested_properties_path, alert: "Could not remove property from your interests."
    end
  end
end
