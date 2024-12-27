class EnquiriesController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @property = Property.find(params[:property_id])
      @enquiry = Enquiry.new
    end
  
    def create
      @property = Property.find(params[:property_id])
      @enquiry = Enquiry.new(enquiry_params)
      @enquiry.user = current_user
      @enquiry.property = @property
  
      if @enquiry.save
        # Send the email to the property owner
  
        redirect_to property_path(@property), notice: 'Your enquiry has been sent to the property owner.'
      else
        redirect_to property_path(@property), alert: 'There was an issue sending your enquiry.'
      end
    end
  
    private
  
    def enquiry_params
      params.require(:enquiry).permit(:message)
    end
  end
  