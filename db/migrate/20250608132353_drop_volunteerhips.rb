class DropVolunteerhips < ActiveRecord::Migration[7.1]
  def change
    drop_table :volunteerships
  end
end
