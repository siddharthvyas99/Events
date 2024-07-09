class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events, id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
      t.string :name
      t.text :description
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.float :entry_fee
      t.string :status
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
