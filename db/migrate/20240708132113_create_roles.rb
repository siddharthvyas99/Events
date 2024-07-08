class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles, id: :uuid, default: -> { 'gen_random_uuid()' }, force: :cascade do |t|
      t.string :name

      t.timestamps
    end
  end
end
