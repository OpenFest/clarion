module Public
  class VolunteerConfirmationsController < Public::ApplicationController
    def create
      @volunteer = Volunteer.find_by!(unique_id: params[:id])

      if ActiveSupport::SecurityUtils.secure_compare(@volunteer.confirmation_token, params[:confirmation_token])
        @volunteer.transaction do
          @volunteer.touch(:confirmed_at)
          @volunteer.update(confirmation_token: nil)
        end

        @volunteer.send_notification_to_volunteer

        redirect_to edit_volunteer_path(@volunteer.unique_id), notice: I18n.t("views.volunteers.email_confirmed_successfully")
      else
        redirect_to root_path, alert: I18n.t("views.volunteers.email_confirmation_error")
      end
    end
  end
end
