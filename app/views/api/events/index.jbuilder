@events.each do |event|
  json.set! event.id do
    json.title event.title
    json.subtitle event.subtitle
    json.length event.length
    json.language event.language
    json.abstract event.abstract
    json.description event.description
    json.event_type_id event.event_type_id
    json.track_id event.track_id
    json.participant_user_ids event.participations.map(&:participant_id)
    json.feedback_url new_event_feedback_url(event_id: event.id)
    json.feedback_qr_code_url event_feedback_qr_code_url(event_id: event.id, format: :svg)
    json.resources_bundle ((event.resources_bundle.attached? && event.conference.end_date < 0.days.from_now) ? rails_blob_url(event.resources_bundle, disposition: "attachment") : nil)
  end
end
