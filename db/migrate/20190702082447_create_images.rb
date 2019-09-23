class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :image
      t.references :user
      t.references  :post
      t.references :message

      t.timestamps
    end
  end
end
