class SendMailWorker
  include Sidekiq::Worker

  def perform(mail_id)
    puts SendMail.call(Email.find(mail_id)).message
  end
end
