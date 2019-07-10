class CreateCrusts < ActiveRecord::Migration[5.2]
  def change
    create_table :crusts do |t|
      t.string :dough
      t.decimal :price 
    end
  end
end
