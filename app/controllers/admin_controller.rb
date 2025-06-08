class AdminController < ActionController::Base
  before_action :set_locale

  layout 'layouts/rails_admin/application'

  def set_locale
    I18n.default_locale = :en
  end
end
