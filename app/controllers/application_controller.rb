class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :is_admin
  before_action :is_authorized
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :is_admin, if: :devise_controller?
  skip_before_action :is_authorized, if: :devise_controller?
  before_action :set_to_french

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:update, keys: [:first_name, :last_name])
    end

  private

    def set_to_french
      I18n.default_locale = :fr      
    end

    def is_admin
      unless current_user && ((current_user.is_authorized && current_user.is_admin) || current_user.creator)
        redirect_to root_path
      end
    end

    def is_authorized
      unless current_user && (current_user.is_authorized || current_user.creator)
        redirect_to root_path
      end
    end
end
