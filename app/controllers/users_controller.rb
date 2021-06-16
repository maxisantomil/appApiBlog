class UsersController < ApplicationController

    def create
        @user =  User.create(email: params[:email],password: params[:password])
        if @user.valid?
            @user.save
            render json: @user, status: :created
        else
            render json: {error: "El usuario no pudo ser registrado"}
        end
    end

end
