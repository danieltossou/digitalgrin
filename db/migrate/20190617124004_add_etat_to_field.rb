class AddEtatToField < ActiveRecord::Migration[5.2]
  def change
    add_column :fields, :etat, :boolean, default: :true
  end
end
