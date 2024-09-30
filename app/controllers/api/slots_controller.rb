class Api::SlotsController < Api::ApplicationController
  include ::CurrentConferenceAssigning
  include ::PublicApiExposing
  before_action :require_current_conference!

  def index
    @slots = current_conference.slots

    fresh_when @slots
  end
end
