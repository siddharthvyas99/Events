class CreateVenues < ActiveRecord::Migration[7.1]
  def change
    create_table :venues, id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
      t.string :name
      t.text :address
      t.float :price

      t.timestamps
    end
  end
end
