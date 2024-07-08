class CreateEventBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :event_bookings do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :event, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
