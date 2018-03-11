class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.string :from
      t.string :to
      t.string :subject
      t.text :content

      t.timestamps
    end
  end
end
