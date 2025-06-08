class MigrateVolunteershipsToVolunteerTeams < ActiveRecord::Migration[7.1]
  def change
    ActiveRecord::Base.transaction do
      Volunteership.all.each do |volunteership|
        team = volunteership.volunteer_team
        user = volunteership.volunteer

        volunteer = Volunteer.find_or_create_by(conference_id: team.conference_id, email: user.email)
        volunteer.conference = team.conference

        volunteer.email = user.email
        volunteer.volunteer_teams << team

        volunteer.save

        volunteership.destroy
      end
    end
  end
end
