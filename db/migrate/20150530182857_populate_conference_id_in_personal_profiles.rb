class Conference < ActiveRecord::Base
end

class PersonalProfile < ActiveRecord::Base
end

class PopulateConferenceIdInPersonalProfiles < ActiveRecord::Migration[4.2]
  def change
    conference = Conference.first

    if conference
      PersonalProfile.where(conference_id: nil).update_all(conference_id: conference.id)
    end
  end
end
