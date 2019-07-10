# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_09_011512) do

  create_table "crusts", force: :cascade do |t|
    t.string "dough"
    t.decimal "price"
  end

  create_table "pizza_toppings", force: :cascade do |t|
    t.integer "pizza_id"
    t.integer "topping_id"
    t.index ["pizza_id"], name: "index_pizza_toppings_on_pizza_id"
    t.index ["topping_id"], name: "index_pizza_toppings_on_topping_id"
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.integer "crust_id"
    t.integer "sauce_id"
    t.index ["crust_id"], name: "index_pizzas_on_crust_id"
    t.index ["sauce_id"], name: "index_pizzas_on_sauce_id"
  end

  create_table "sauces", force: :cascade do |t|
    t.string "flavor"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
  end

end
