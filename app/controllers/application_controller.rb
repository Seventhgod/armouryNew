class ApplicationController < ActionController::Base
  include ForgeryProtection
  include SetPlatform
  layout 'login'

  def after_sign_in_path_for(resource)
    trial_index_path
  end
end
