require 'rails_helper'

describe "Pizzas Index" do
    it "shows all pizzas names" do
        crust_1 = Crust.create(dough: "One", price: 1.00)
        crust_2 = Crust.create(dough: "Two", price: 2.00)
        crust_3 = Crust.create(dough: "Three", price: 3.00)
        
        sauce_1 = Sauce.create(flavor: "Uno")
        sauce_2 = Sauce.create(flavor: "Dos")
        sauce_3 = Sauce.create(flavor: "Tres")
        
        pizza_1 = Pizza.create(name: "Basic Bitch", size: "Small", crust_id: 1, sauce_id: 1)
        pizza_2 = Pizza.create(name: "The Shit", size: "Large", crust_id: 2, sauce_id: 2)
        pizza_3 = Pizza.create(name: "The Yum YUM", size: "Medium", crust_id: 3, sauce_id: 3)

        visit pizzas_path
        # binding.pry
        # save_and_open_page
        
        expect(page).to have_content(pizza_1.name)
        expect(page).to have_content(pizza_2.name)
        expect(page).to have_content(pizza_3.name)
    end
end

describe "Pizza Show Page" do
    it "index links to pizzas show page and displays all information" do
        crust_1 = Crust.create(dough: "One", price: 1.00)
        
        sauce_1 = Sauce.create(flavor: "Uno")
        
        pizza_1 = Pizza.create(name: "Basic Bitch", size: "Small", crust_id: 1, sauce_id: 1)

        visit pizzas_path
        # binding.pry
        # save_and_open_page

        click_on(pizza_1.name)

        expect(page).to have_content(pizza_1.name)
        expect(page).to have_content(pizza_1.size)
        expect(page).to have_content(pizza_1.crust.dough)
        expect(page).to have_content(pizza_1.sauce.flavor)
    end
end

describe "Pizza New Page" do
    it "creates Pizza correctly, displays on show page" do
        crust_1 = Crust.create(dough: "One", price: 1.00)
        
        sauce_1 = Sauce.create(flavor: "Uno")
        
        visit new_pizza_path

        fill_in "pizza_name", with: "Yo"
        select "Small", from: "pizza[size]"
        select "One", from: "pizza[crust_id]"
        select "Uno", from: "pizza[sauce_id]"

        click_on "Put Your Pizza in the Oven!"

        # binding.pry
        # save_and_open_page

        expect(page).to have_content(Pizza.find_by(name: "Yo").name)
        expect(page).to have_content(Pizza.find_by(name: "Yo").size)
        expect(page).to have_content(Pizza.find_by(name: "Yo").crust.dough)
        expect(page).to have_content(Pizza.find_by(name: "Yo").sauce.flavor)
    end

    it "displays error messages when no name, size, crust, and/or sauce selected" do
        visit new_pizza_path
        
        click_on "Put Your Pizza in the Oven!"

        # binding.pry
        # save_and_open_page

        expect(page).to have_content("Name yo za!")
        expect(page).to have_content("Please size that ish boo")
        expect(page).to have_content("What dough do we knead?")
        expect(page).to have_content("Don't get lost in the sauce!")
    end
end