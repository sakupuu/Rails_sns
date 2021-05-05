class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
  end
  
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end

end