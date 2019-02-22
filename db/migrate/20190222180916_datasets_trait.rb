class DatasetsTrait < ActiveRecord::Migration[5.1]
  def change
    
    create_table :datasets_traits, id: false do |t|
      t.belongs_to :dataset, index: true
      t.belongs_to :trait, index: true
    end

  end
end
