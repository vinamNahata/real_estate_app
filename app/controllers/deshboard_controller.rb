class DeshboardController < ApplicationController
  def index
    if current_user.role == 'buyer'
      @properties = Property.all
    else current_user.role == 'seller'
      @properties = current_user.properties
   
    end
  end
end
