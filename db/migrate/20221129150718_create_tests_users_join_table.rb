class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test], unique: true
    end
  end
end