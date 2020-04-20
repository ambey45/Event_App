class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|
      t.integer :user_id
      t.integer :event_id
      t.datetime :joining_date
      t.float :fee_paid

      t.timestamps
    end
  end
end
