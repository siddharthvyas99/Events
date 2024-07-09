json.user do
  json.partial! 'users/show', user: @event_booking.user
end

json.event do
  json.partial! 'events/show', user: @event_booking.event
end
