class ConvertConferencesEndDateToTimestampWithTz < ActiveRecord::Migration[5.2]
  def up
    unless ActiveRecord::Base.connection.adapter_name.downcase.to_sym == :postgresql then
      return
    end

    transaction do
      execute "ALTER TABLE conferences ALTER end_date TYPE timestamptz USING end_date AT TIME ZONE 'UTC';"
    end
  end
end
