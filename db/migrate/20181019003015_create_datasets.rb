class CreateDatasets < ActiveRecord::Migration[5.1]
  def change
    create_table :datasets do |t|
      t.string :dataset_name
      t.string :doi_dataset
      t.string :doi_reference
      t.text :description
      t.string :license
      t.string :taxonomic_group
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
