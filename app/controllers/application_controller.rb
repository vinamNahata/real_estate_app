class ApplicationController < ActionController::Base
    before_action :authenticate_user!, unless: :home_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?
    
      protected
    
      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      end


    private

    def after_sign_in_path_for(resource)
      root_path
    end   
    def after_sign_out_path_for(resource)
        root_path
    end    

    def home_controller?
        controller_name == "home"
    end    
end
