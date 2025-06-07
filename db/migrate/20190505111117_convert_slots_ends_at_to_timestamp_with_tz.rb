class ConvertSlotsEndsAtToTimestampWithTz < ActiveRecord::Migration[5.2]
  def up
    unless ActiveRecord::Base.connection.adapter_name.downcase.to_sym == :postgresql then
      return
    end

    transaction do
      execute "ALTER TABLE slots ALTER ends_at TYPE timestamptz USING ends_at AT TIME ZONE 'UTC';"
    end
  end
end
