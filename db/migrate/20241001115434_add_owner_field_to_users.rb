class AddOwnerFieldToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :owner, :boolean, null: false, default: false
  end
end
