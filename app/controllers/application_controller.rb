class ApplicationController < ActionController::Base
  include CurrentConferenceAssigning

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :set_view_paths

  layout "public/application"

  def self.default_url_options(options = {})
    if I18n.locale != I18n.default_locale
      options.merge({locale: I18n.locale})
    else
      options
    end
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    if user_signed_in? && (current_user.language != I18n.locale)
      current_user.update(language: I18n.locale)
    end
  end

  def set_view_paths
    prepend_view_path "lib/initfest/views"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:language])
  end
end
