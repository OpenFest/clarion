class Slot < ActiveRecord::Base
  belongs_to :hall
  belongs_to :event, required: false
  belongs_to :approved_event, -> { joins(:proposition).approved_joined }, class_name: 'Event', foreign_key: 'event_id'
end
