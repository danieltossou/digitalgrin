class FieldsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :fields_users, id: false do |t|
      t.belongs_to :field, index: true
      t.belongs_to :user, index: true
    end
  end
end
