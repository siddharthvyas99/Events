json.event_bookings @event_bookings do |event_booking|
  json.partial! "event_bookings/show", event_booking:
end
