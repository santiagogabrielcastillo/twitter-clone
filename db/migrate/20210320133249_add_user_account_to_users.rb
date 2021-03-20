class AddUserAccountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_account, :string
  end
end
