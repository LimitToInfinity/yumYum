class AddPriceToSauces < ActiveRecord::Migration[5.2]
  def change
    add_column :sauces, :price, :decimal
  end
end
