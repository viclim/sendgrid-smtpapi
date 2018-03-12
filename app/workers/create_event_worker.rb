class CreateEventWorker
  include Sidekiq::Worker

  def perform(json)
    json = JSON.parse(json)
    email = Email.find(json['mail_id'])
    email.events.create!(payload: json)
    ActionCable.server.broadcast("event_#{json['mail_id']}", json)
  end
end
