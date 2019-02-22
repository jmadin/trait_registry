class CreateTraits < ActiveRecord::Migration[5.1]
  def change
    create_table :traits do |t|
      t.string :trait_name
      t.string :trait_guid
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
