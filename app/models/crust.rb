class Crust < ActiveRecord::Base
    has_many :pizzas

    def name_with_price
        dough + " $" + "%.2f" % price.to_f
    end
end