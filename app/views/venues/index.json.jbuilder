json.venues @venues do |venue|
  json.partial! "venues/show", venue:
end
