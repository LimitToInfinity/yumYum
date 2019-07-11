class User < ApplicationRecord
    has_secure_password
    
    has_many :pizzas
    has_many :toppings, through: :pizzas
    has_many :sauces, through: :pizzas
    has_many :crusts, through: :pizzas

    validates :username, presence: { message: "What's yo usaname!" }, uniqueness: { message: "That username taken yo!" }
end
