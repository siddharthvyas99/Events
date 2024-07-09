# frozen_string_literal: true

class AddDummyUsers < ActiveRecord::Migration[7.1]
  def up
    firstnames = ["paul", "kaylee", "stacee", "rosemary", "jamika", "sally"]
    lastnames = ["ferry", "kuvalis", "williamson", "newton", "slack"]
    @visitor_pool = firstnames.product(lastnames).shuffle

    admin = Role.create!(name: "admin")
    @visitor = Role.create!(name: "visitor")

    User.create! \
      email: "oliver@example.com",
      first_name: "Oliver",
      last_name: "Smith",
      role_id: admin.id,
      password: Rails.application.secrets.default_password

    10.times do
      User.create!(fetch_visitor())
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

  private

    def fetch_visitor()
      first_name, last_name = @visitor_pool.pop
      {
        email: "#{first_name}.#{last_name}@example.com",
        first_name: first_name.capitalize,
        last_name: last_name.capitalize,
        password: "welcome",
        role_id: @visitor.id
      }
    end
end
