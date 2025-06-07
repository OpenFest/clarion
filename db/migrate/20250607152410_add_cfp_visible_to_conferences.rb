class AddCfpVisibleToConferences < ActiveRecord::Migration[7.1]
  def change
    add_column :conferences, :cfp_visible, :boolean, null: true, default: true
  end
end
