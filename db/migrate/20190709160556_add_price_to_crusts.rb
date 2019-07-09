class AddPriceToCrusts < ActiveRecord::Migration[5.2]
  def change
    add_column :crusts, :price, :decimal
  end
end
