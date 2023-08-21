class ChangeUsersToEndUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :end_users
  end
end
