class RemovePriceFromSauces < ActiveRecord::Migration[5.2]
  def change
    remove_column :sauces, :price, :decimal
  end
end
