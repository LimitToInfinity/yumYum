# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Topping.destroy_all
Crust.destroy_all
Sauce.destroy_all

Topping.create(name: "Pepperoni", price: 1.50)
Topping.create(name: "Chicken", price: 1.25)
Topping.create(name: "Beef", price: 1.50)
Topping.create(name: "Ham", price: 1.35)
Topping.create(name: "Bacon", price: 2.00)
Topping.create(name: "Black Olives", price: 0.75)
Topping.create(name: "Mushrooms", price: 0.50)
Topping.create(name: "Onions", price: 0.40)
Topping.create(name: "Banana Peppers", price: 1.00)
Topping.create(name: "Jalapeños Peppers", price: 0.75)
Topping.create(name: "Extra Cheese", price: 1.15)

Crust.create(dough: "Regular", price: 6.00)
Crust.create(dough: "Thin", price: 6.00)
Crust.create(dough: "Deep Dish", price: 6.00)
Crust.create(dough: "Focaccia", price: 8.00)
Crust.create(dough: "Stuffed", price: 9.00)

Sauce.create(flavor: "Marinara")
Sauce.create(flavor: "Tomato")
Sauce.create(flavor: "BBQ")
Sauce.create(flavor: "Alfredo")
Sauce.create(flavor: "Garlic Parmesan")
Sauce.create(flavor: "Sweet and Tangy")
Sauce.create(flavor: "Chipotle Sriracha")