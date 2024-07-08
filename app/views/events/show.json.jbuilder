json.extract! @event, :id, :name, :description, :entry_fee, :start_datetime,
  :end_datetime, :status

json.event_url @event.event_url

json.venue do
  json.partial! 'venues/show', user: @venue.event
end
