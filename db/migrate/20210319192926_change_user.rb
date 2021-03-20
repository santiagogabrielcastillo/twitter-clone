class ChangeUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :bio, :text
    add_column :users, :location, :string
    add_column :users, :birth_date, :date
    add_column :users, :phone_number, :string
  end
end
