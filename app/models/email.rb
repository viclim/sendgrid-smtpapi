class Email < ApplicationRecord
  self.table_name = 'mails'

  has_many :events, foreign_key: 'mail_id'

  def message
    smtpapi = {
      to:          [to],
      unique_args: { mail_id: id }
    }
    [
      "From: #{pretty_from} <#{from}>",
      "To: #{pretty_to} <#{to}>",
      "Subject: #{subject}",
      "Date: #{Time.now.to_s(:rfc822)}",
      "X-SMTPAPI: #{smtpapi.to_json}",
      '',
      content.html_safe
    ].join("\n")
  end

  def pretty_from
    from.split('@').first.gsub(/[^0-9a-z ]/i, ' ').titleize
  end

  def pretty_to
    to.split('@').first.gsub(/[^0-9a-z ]/i, ' ').titleize
  end
end
