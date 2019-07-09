class Pizza < ActiveRecord::Base
    has_many :pizza_toppings
    has_many :toppings, through: :pizza_toppings
    belongs_to :crust
    belongs_to :sauce

    accepts_nested_attributes_for :toppings
    accepts_nested_attributes_for :crust
    accepts_nested_attributes_for :sauce

    validates :name, presence: { message: "Name yo za!" }
    validates :crust_id, presence: { message: "What dough do we knead?" }
    validates :sauce_id, presence: { message: "Don't get lost in the sauce!" }


    def total_toppings_price
        (@toppings_price = toppings.map { |topping| topping.price }.reduce(:+)).sprintf("%.2f")
    end

    def total_pizza_price 
        (total_toppings_price + crust.price).sprintf("%.2f" % number)
    end


end