class AddVolunteerTeamToVolunteers < ActiveRecord::Migration[7.1]
  class VolunteerTeam < ActiveRecord::Base
    has_and_belongs_to_many :volunteers
  end

  class Volunteer < ActiveRecord::Base
    belongs_to :volunteer_team
    has_and_belongs_to_many :volunteer_teams
  end

  def change
    add_reference :volunteers, :volunteer_team, foreign_key: true

    reversible do |dir|
      dir.up do
        transaction do
          Volunteer.all.find_each do |volunteer|
            volunteer.update(volunteer_team: volunteer.volunteer_teams.first)
          end
        end
      end

      dir.down do
        # no-op
      end
    end

    change_column_null :volunteers, :volunteer_team_id, true
  end
end
