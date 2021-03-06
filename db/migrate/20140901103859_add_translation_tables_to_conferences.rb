class AddTranslationTablesToConferences < ActiveRecord::Migration[4.2]
  def up
    Conference.create_translation_table!({
      title: :string,
      description: :text,
    }, {
      migrate_data: true,
    })
  end

  def down
    Conference.drop_translation_table! migrate_data: true
  end
end
