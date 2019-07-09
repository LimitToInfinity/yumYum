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

Topping.create(name: "Pepperoni")
Topping.create(name: "Chicken")
Topping.create(name: "Beef")
Topping.create(name: "Ham")
Topping.create(name: "Bacon")
Topping.create(name: "Black Olives")
Topping.create(name: "Mushrooms")
Topping.create(name: "Onions")
Topping.create(name: "Banana Peppers")
Topping.create(name: "Jalapeños Peppers")
Topping.create(name: "Cheese")
Topping.create(name: "Extra Cheese")

Crust.create(dough: "Regular")
Crust.create(dough: "Thin")
Crust.create(dough: "Deep Dish")
Crust.create(dough: "Focaccia")

Sauce.create(flavor: "Marinara")
Sauce.create(flavor: "Tomato")
Sauce.create(flavor: "BBQ")
Sauce.create(flavor: "Alfredo")
Sauce.create(flavor: "Garlic Parmesan")
Sauce.create(flavor: "Sweet and Tangy")
Sauce.create(flavor: "Chipotle Sriracha")