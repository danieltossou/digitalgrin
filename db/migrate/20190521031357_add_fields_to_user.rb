class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :picture, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :gender, :string
  end
end
