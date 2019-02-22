class AddDatasetToTraits < ActiveRecord::Migration[5.1]
  def change
    add_reference :traits, :dataset, foreign_key: true
  end
end
