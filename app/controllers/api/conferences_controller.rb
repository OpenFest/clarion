class Api::ConferencesController < Api::ApplicationController
  include ::PublicApiExposing

  def index
    @conferences = Conference.all
    fresh_when @conferences
  end
end
