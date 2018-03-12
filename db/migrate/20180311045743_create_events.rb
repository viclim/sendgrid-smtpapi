class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :mail, foreign_key: true
      t.jsonb :payload

      t.timestamps
    end
  end
end
