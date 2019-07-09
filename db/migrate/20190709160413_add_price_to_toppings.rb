class AddPriceToToppings < ActiveRecord::Migration[5.2]
  def change
    add_column :toppings, :price, :decimal
  end
end
