class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  skip_before_action :verify_authenticity_token
  
  # protect_from_forgery prepend: true, with: :exception
  # protect_from_forgery with: :null_session # Same.
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
      # devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
