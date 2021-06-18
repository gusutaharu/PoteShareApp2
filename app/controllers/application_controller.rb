class ApplicationController < ActionController::Base
    
  before_action :configure_permitted_parameters, if: :devise_controller?
    
  before_action :search

  def search
        if params[:search]
         @rooms = Room.search(params[:search])
        elsif params[:search_keyword]
          @rooms = Room.search_keyword(params[:search_keyword])
        end
      end


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
end
