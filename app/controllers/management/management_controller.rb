require "csv"
module Management
  class ManagementController < ::ApplicationController
    before_action :authenticate_user!, :authorize_user!

    layout "management"

    private

    def authorize_user!
      if params[:conference_id] && params[:conference_id].to_i < Conference.last.id
        head :forbidden unless current_user.admin? && current_user.owner?
      else
        head :forbidden unless current_user.admin?
      end
    end
  end
end
