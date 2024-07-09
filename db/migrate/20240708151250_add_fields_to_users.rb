class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

    add_reference :users, :role, type: :uuid, foreign_key: true
  end
end
