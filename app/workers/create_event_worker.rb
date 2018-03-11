class CreateEventWorker
  include Sidekiq::Worker

  def perform(json)
    json = JSON.parse(json)
    puts json['mail_id']
    email = Email.find(json['mail_id'])
    email.events.create!(payload: json)
  end
end
