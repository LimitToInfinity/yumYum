class AddUserReferenceToPizzas < ActiveRecord::Migration[5.2]
  def change
    add_reference :pizzas, :user, foreign_key: true
  end
end
