require 'rails_helper'

describe "Analytics Index" do
    it "displays correctly" do
        crust_1 = Crust.create(dough: "One", price: 1.00)
        crust_2 = Crust.create(dough: "Two", price: 2.00)
        crust_3 = Crust.create(dough: "Three", price: 3.00)
        
        sauce_1 = Sauce.create(flavor: "Uno")
        sauce_2 = Sauce.create(flavor: "Dos")
        sauce_3 = Sauce.create(flavor: "Tres")
        
        pizza_1 = Pizza.create(name: "Basic Bitch", size: "Small", crust_id: 1, sauce_id: 1)
        pizza_2 = Pizza.create(name: "The Shit", size: "Large", crust_id: 2, sauce_id: 2)
        pizza_3 = Pizza.create(name: "The Yum YUM", size: "Medium", crust_id: 3, sauce_id: 3)

        visit "analytics"
        # binding.pry
        # save_and_open_page
        
        expect(page).to have_content(pizza_1.name)
        expect(page).to have_content(pizza_2.name)
        expect(page).to have_content(pizza_3.name)

        expect(page).to have_content(pizza_1.total_pizza_price)
        expect(page).to have_content(pizza_2.total_pizza_price)
        expect(page).to have_content(pizza_3.total_pizza_price)

        expect(page).to have_content(pizza_1.total_toppings_price)
        expect(page).to have_content(pizza_2.total_toppings_price)
        expect(page).to have_content(pizza_3.total_toppings_price)

        expect(page).to have_content("Proteinness")
        expect(page).to have_content("Veggie-ness")
    end
end