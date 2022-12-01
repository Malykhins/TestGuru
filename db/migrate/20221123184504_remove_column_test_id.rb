class RemoveColumnTestId < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :test, :integer
  end
end
