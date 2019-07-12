class SessionsController < ApplicationController

    def new
        @user = User.new

        render "login/login"
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user
            @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to pizzas_path        
        else
            @user = User.new
            @error = "You done screwed the pooch!"
            render "login/login"
        end
    end

    def destroy
        session[:user_id] = nil

        redirect_to pizzas_path
    end

end