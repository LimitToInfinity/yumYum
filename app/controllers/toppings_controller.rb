# class ToppingsController < ApplicationController

#     before_action :find_topping, only: [:show, :edit, :update, :destroy]

#     def index
#         @toppings = Topping.all
#     end

#     def show
#     end

#     def new
#         @topping = Topping.new
#     end

#     def create
#         @topping = Topping.new(topping_params)
#         if @Topping.save
#             redirect_to @topping
#         else
#             render :new
#         end
#     end

#     def edit
#     end

#     def update
#         if @Topping.valid?
#         @topping = Topping.update(topping_params)
#         redirect_to @topping
#         else
#             render :edit
#         end
#     end

#     def destroy
#         @topping.destroy
#         redirect_to toppings_path
#     end

#     private
#     def topping_params
#         params.require(:topping).permit(:name)
#     end

#     def find_topping
#         @topping = Topping.find(params[:id])
#     end

# end