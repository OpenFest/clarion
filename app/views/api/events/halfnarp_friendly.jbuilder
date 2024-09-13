json.array! @events, cached: ->(event) { [event, event.track, event.event_type] } do |event|
  json.id event.id
  json.title event.title
  json.abstract event.abstract
  json.track_id event.track_id

  json.track do
    json.name event.track.name
  end
  json.event_type do
    json.name event.event_type.name
  end
end
