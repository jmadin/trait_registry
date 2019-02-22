class CreateTaxa < ActiveRecord::Migration[5.1]
  def change
    create_table :taxa do |t|
      t.string :taxon_name
      t.string :taxon_guid
      t.references :dataset, foreign_key: true

      t.timestamps
    end
  end
end
