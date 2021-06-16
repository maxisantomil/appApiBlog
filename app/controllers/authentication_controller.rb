class AuthenticationController < ApplicationController

    def login
        user = User.find_by(email: params[:email])
        
        if (!user)
            render({
                json: { error: "email invalido"},status: :unauthorized
            })
        else
            if user.authenticate(params[:password])
                payload = {user_id: user.id,email: user.email}
                token = JWT.encode(payload, 'okcool', 'HS256')
                render json: {token: token }
            else
                render json: { message: "password incorrecto!"}, status: :unauthorized
            end
        end
    end 
end
