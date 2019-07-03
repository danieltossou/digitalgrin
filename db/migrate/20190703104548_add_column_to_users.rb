class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstName, :string
    add_column :users, :bio, :text
    add_column :users, :country, :string
    add_column :users, :status, :string
  end
end
