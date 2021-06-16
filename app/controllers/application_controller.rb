
class ApplicationController < ActionController::API
   
    def authenticate
        authorization_header = request.headers[:authorization]
        if !authorization_header
            render status: :unauthorized
        else

            token = authorization_header.split(" ")[1]
            decoded_token = JWT.decode(token,'okcool', 'HS256')

            @user = User.find(decoded_token[0]["user_id"])
        end
    end
end
