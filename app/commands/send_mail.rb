require 'net/smtp'

class SendMail
  class << self
    def call(mail)
      Net::SMTP.start(
        Rails.configuration.sendgrid[:server],
        Rails.configuration.sendgrid[:port],
        'sendgrid-smtpapi.herokuapp.com',
        Rails.configuration.sendgrid[:username],
        Rails.configuration.sendgrid[:password],
        :plain
      ) do |smtp|
        smtp.send_message(mail.message, mail.from, mail.to)
      end
    end
  end
end
