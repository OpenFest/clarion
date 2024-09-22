class AddTermsAcceptedToVolunteer < ActiveRecord::Migration[7.1]
  def change
    add_column :volunteers, :terms_accepted, :boolean, default: false
  end
end
