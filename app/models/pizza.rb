class Pizza < ActiveRecord::Base
    has_many :pizza_toppings
    has_many :toppings, through: :pizza_toppings
    belongs_to :crust
    belongs_to :sauce

    accepts_nested_attributes_for :toppings
    accepts_nested_attributes_for :crust
    accepts_nested_attributes_for :sauce

    validates :name, presence: { message: "Name yo za!" }
    validates :size, presence: { message: "Please size that ish boo" }
    validates :crust_id, presence: { message: "What dough do we knead?" }
    validates :sauce_id, presence: { message: "Don't get lost in the sauce!" }

# instance methods
    
    def total_proteins_price
        proteins_array = []
        toppings.each do |topping|
            if ["Pepperoni", "Chicken", "Beef", "Ham", "Bacon"].include?(topping.name)
                proteins_array << topping.price
            end
        end
        @proteins_price = proteins_array.reduce(:+)
        if @proteins_price == nil
            "0.00"
        else
            "%.2f" % @proteins_price
        end
    end
    
    def total_veggies_price
        veggies_array = []
        toppings.each do |topping|
            if ["Black Olives", "Mushrooms", "Onions", "Banana Peppers", "Jalapeño Peppers"].include?(topping.name)
                veggies_array << topping.price
            end
        end
        @veggies_price = veggies_array.reduce(:+)
        if @veggies_price == nil
            "0.00"
        else
            "%.2f" % @veggies_price
        end
    end
    
    def total_toppings_price
        @toppings_price = toppings.map { |topping| topping.price }.reduce(:+)
        if @toppings_price == nil
            "0.00"
        else
            "%.2f" % @toppings_price
        end
    end
    
    def total_pizza_price
        @base_price = total_toppings_price.to_f + crust.price
        if size == "Small"
            @pizza_price = @base_price
        elsif size == "Medium"
            @pizza_price = @base_price + 2.00
        elsif size == "Large"
            @pizza_price = @base_price + 4.00
        end
        "%.2f" % @pizza_price
    end

# class methods
    
    def self.avg_price
        @all_pizzas_prices = Pizza.all.map { |pizza| (pizza.total_pizza_price.to_f) }
        @average_pizza_price = (@all_pizzas_prices.reduce(:+) / @all_pizzas_prices.length).to_f
        "%.2f" % @average_pizza_price
    end

    def self.avg_proteins_price
        @all_pizzas_proteins_prices = Pizza.all.map { |pizza| (pizza.total_proteins_price.to_f) }
        @average_pizzas_proteins_price = (@all_pizzas_proteins_prices.reduce(:+) / @all_pizzas_proteins_prices.length).to_f
        "%.2f" % @average_pizzas_proteins_price
    end

    def self.avg_veggies_price
        @all_pizzas_veggies_prices = Pizza.all.map { |pizza| (pizza.total_veggies_price.to_f) }
        @average_pizzas_veggies_price = (@all_pizzas_veggies_prices.reduce(:+) / @all_pizzas_veggies_prices.length).to_f
        "%.2f" % @average_pizzas_veggies_price
    end

    def self.avg_toppings_price
        @all_pizzas_toppings_prices = Pizza.all.map { |pizza| (pizza.total_toppings_price.to_f) }
        @average_pizzas_toppings_price = (@all_pizzas_toppings_prices.reduce(:+) / @all_pizzas_toppings_prices.length).to_f
        "%.2f" % @average_pizzas_toppings_price
    end

    def self.most_popular_protein
        @all_proteins_array = []
        
        Pizza.all.map do |pizza| 
            pizza.toppings.map do |topping|
                if ["Pepperoni", "Chicken", "Beef", "Ham", "Bacon"].include?(topping.name)
                    @all_proteins_array << topping.name
                end
            end
        end
        
        count = []  # Number of times element is repeated in array
        output = [] 
        unique = @all_proteins_array.flatten.uniq
        j=0
    
        unique.each do |i|
            count[j] = @all_proteins_array.flatten.count(i)
            j+=1
        end
        k=0
        count.each do |i|
            output[k] = unique[k] if i == count.max
            k+=1
        end  
    
        output.compact.join(", ")

    end

    def self.most_popular_veggie
        @all_veggies_array = []
        
        Pizza.all.map do |pizza| 
            pizza.toppings.map do |topping|
                if ["Black Olives", "Mushrooms", "Onions", "Banana Peppers", "Jalapeño Peppers"].include?(topping.name)
                    @all_veggies_array << topping.name
                end
            end
        end
        
        count = []  # Number of times element is repeated in array
        output = [] 
        unique = @all_veggies_array.flatten.uniq
        j=0
    
        unique.each do |i|
            count[j] = @all_veggies_array.flatten.count(i)
            j+=1
        end
        k=0
        count.each do |i|
            output[k] = unique[k] if i == count.max
            k+=1
        end  
    
        output.compact.join(", ")
        
    end

    def self.most_popular_topping
        
        @all_toppings_array = Pizza.all.map do |pizza| 
            pizza.toppings.map do |topping|
                topping.name
            end
        end.flatten

        count = []  # Number of times element is repeated in array
        output = [] 
        unique = @all_toppings_array.uniq
        j=0
    
        unique.each do |i|
            count[j] = @all_toppings_array.count(i)
            j+=1
        end
        k=0
        count.each do |i|
            output[k] = unique[k] if i == count.max
            k+=1
        end  
    
        output.compact.join(", ")
    
    end

    def self.most_popular_crust
    
        @all_crusts_array = Pizza.all.map do |pizza| 
            pizza.crust.dough
        end

        count = []  # Number of times element is repeated in array
        output = [] 
        unique = @all_crusts_array.uniq
        j=0
    
        unique.each do |i|
            count[j] = @all_crusts_array.count(i)
            j+=1
        end
        k=0
        count.each do |i|
            output[k] = unique[k] if i == count.max
            k+=1
        end  
    
        output.compact.join(", ")
        
    end

    def self.most_popular_sauce
    
        @all_sauces_array = Pizza.all.map do |pizza| 
            pizza.sauce.flavor
        end

        count = []  # Number of times element is repeated in array
        output = [] 
        unique = @all_sauces_array.uniq
        j=0
    
        unique.each do |i|
            count[j] = @all_sauces_array.count(i)
            j+=1
        end
        k=0
        count.each do |i|
            output[k] = unique[k] if i == count.max
            k+=1
        end  
    
        output.compact.join(", ")
        
    end

    def self.most_popular_size
    
        @all_sizes_array = Pizza.all.map do |pizza| 
            pizza.size
        end

        count = []  # Number of times element is repeated in array
        output = [] 
        unique = @all_sizes_array.uniq
        j=0
    
        unique.each do |i|
            count[j] = @all_sizes_array.count(i)
            j+=1
        end
        k=0
        count.each do |i|
            output[k] = unique[k] if i == count.max
            k+=1
        end  
    
        output.compact.join(", ")
        
    end

    def self.number_non_protein_pizzas
        @pizza_toppings_array = Pizza.all.map do |pizza| 
            pizza.toppings.map do |topping|
                topping.name
            end    
        end
        
        pizzas_without_proteins_count = 0
        @pizza_toppings_array.each do |pizza_toppings|
            if !pizza_toppings.any? { |i| ["Pepperoni", "Chicken", "Beef", "Ham", "Bacon"].include?(i) }
                pizzas_without_proteins_count += 1
            end
        end
        pizzas_without_proteins_count
    end    

    def self.number_non_veggie_pizzas
        @pizza_toppings_array = Pizza.all.map do |pizza| 
            pizza.toppings.map do |topping|
                topping.name
            end    
        end
        
        pizzas_without_veggies_count = 0
        @pizza_toppings_array.each do |pizza_toppings|
            if !pizza_toppings.any? { |i| ["Black Olives", "Mushrooms", "Onions", "Banana Peppers", "Jalapeño Peppers"].include?(i) }
            pizzas_without_veggies_count += 1
            end
        end
        pizzas_without_veggies_count
    end

    

end