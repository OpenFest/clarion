@halls.each do |hall|
  json.set! hall.name do
    json.days do
      hall.slots.to_a.sort_by(&:starts_at).group_by { |slot| slot.starts_at.to_date }.each do |day, slots|
        json.set! day do
          json.array! slots do |slot|
            next unless slot.approved_event
            json.starts_at slot.starts_at
            json.starts_at_human l(slot.starts_at, format: '%a, %H:%M')
            json.title slot.approved_event.title
            json.speakers do
              json.array! slot.approved_event.participants_with_personal_profiles do |participant|
                json.name participant.name
                json.email participant.public_email
              end
            end
          end
        end
      end
    end
  end
end
