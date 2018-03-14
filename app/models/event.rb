class Event < ApplicationRecord
  belongs_to :email, foreign_key: 'mail_id', optional: true
end
