class CreateEventWorker
  include Sidekiq::Worker

  def perform(json)
    json = JSON.parse(json)
    email = Email.find_by(id: json['mail_id'])
    Event.create!(email: email, payload: json)
    ActionCable.server.broadcast("event_#{json['mail_id']}", json)
  end
end
