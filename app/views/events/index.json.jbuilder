json.events @events do |event|
  json.partial! "events/show", event:
end
