class UserMailer < ApplicationMailer
    default from: "no-reply@RealEstate.com"
  
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: "Welcome to Real Estate Platform.")
    end
    
        # Method to send enquiry email to the property owner
        def property_enquiry_email(enquiry)
          @enquiry = enquiry
          @property_owner = @enquiry.property.user # Get the property owner
          @property = @enquiry.property
          @message = @enquiry.message
          Rails.logger.debug("Property Owner: #{@property_owner.inspect}")
  Rails.logger.debug("Property: #{@property.inspect}")
      
          # Send email to property owner
          mail(
            from: @enquiry.user.email,
            to: @property_owner.email,
            subject: "New Enquiry about #{@property.name}"
          )
        end
      
      
  end
  