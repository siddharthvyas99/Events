
class Event < ActiveRecord::Base
	belongs_to :user
  belongs_to :venue

  def event_url
    Rails.application.routes.url_helpers.event_url(self, host: host_for_env)
  end

  private

  def host_for_env
    case Rails.env
    when "development"
      "localhost:3000"
    when "production"
      "example.net"
    else
      "example.com"
    end
  end
end
