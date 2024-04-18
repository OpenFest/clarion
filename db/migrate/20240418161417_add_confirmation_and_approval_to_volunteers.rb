class AddConfirmationAndApprovalToVolunteers < ActiveRecord::Migration[7.1]
  class Volunteer < ActiveRecord::Base; end

  def change
    add_column :volunteers, :confirmation_token, :string
    add_index :volunteers, :confirmation_token
    add_column :volunteers, :confirmed_at, :timestamptz
    add_index :volunteers, :confirmed_at
    add_column :volunteers, :approved_at, :timestamptz
    add_index :volunteers, :approved_at

    reversible do |dir|
      dir.up do
        execute "UPDATE volunteers SET confirmed_at = created_at, approved_at = created_at;"
      end

      dir.down do
        # no-op
      end
    end
  end
end
