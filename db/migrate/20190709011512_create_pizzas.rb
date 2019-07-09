class CreatePizzas < ActiveRecord::Migration[5.2]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :size
      t.references :crust, foreign_key: true
      t.references :sauce, foreign_key: true
    end
  end
end
