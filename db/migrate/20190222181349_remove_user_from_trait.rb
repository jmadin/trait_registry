class RemoveUserFromTrait < ActiveRecord::Migration[5.1]
  def change
    remove_column :traits, :dataset_id
    remove_column :traits, :user_id
  end
end
