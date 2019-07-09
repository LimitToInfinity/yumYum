class CreateSauces < ActiveRecord::Migration[5.2]
  def change
    create_table :sauces do |t|
      t.string :flavor
    end
  end
end
