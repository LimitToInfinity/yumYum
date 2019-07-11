class PizzasController < ApplicationController

    before_action :find_pizza, only: [:show, :edit, :update, :destroy]

    def index
        @pizzas = Pizza.all
    end

    def show
    end

    def new
        @pizza = Pizza.new
    end

    def create
        @pizza = Pizza.new(pizza_params)
        if @pizza.save
            redirect_to @pizza
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @pizza.valid?
        @pizza = Pizza.update(pizza_params)
        redirect_to @pizza
        else
            render :edit
        end
    end

    def destroy
        @pizza.destroy
        redirect_to pizzas_path
    end

    private
    def pizza_params
        params.require(:pizza).permit(:name, :size,
        :user_id,
        :crust_id,
        :sauce_id,
        topping_ids: [])
    end

    def find_pizza
        @pizza = Pizza.find(params[:id])
    end

end