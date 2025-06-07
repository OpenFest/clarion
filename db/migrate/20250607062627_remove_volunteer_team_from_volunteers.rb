class RemoveVolunteerTeamFromVolunteers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :volunteers, :volunteer_team, null: false, foreign_key: true
  end
end
