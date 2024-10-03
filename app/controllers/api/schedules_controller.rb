class Api::SchedulesController < Api::ApplicationController
  include ::CurrentConferenceAssigning
  include ::PublicApiExposing
  before_action :require_current_conference!

  def show
    @halls = Conference.last.halls.includes(:translations, slots: {approved_event: [:participants_with_personal_profiles, :proposition]})
  end
end
