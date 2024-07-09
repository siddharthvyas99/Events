json.users @users do |user|
  json.partial! "users/show", user:
end
