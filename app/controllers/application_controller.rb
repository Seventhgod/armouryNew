class ApplicationController < ActionController::Base
  include ForgeryProtection
  include SetPlatform
  layout 'login'

  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :html, :json

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
  def after_sign_in_path_for(resource)
    trial_index_path
  end
end
