require 'rails_helper'

#atencion!
#por el momento para probarlos borrar los endpoint de before_action del controller posts

describe 'Posts API',type: :request do
    #chequea para esa ruta devuelva todas los posts ya guardadas,si es correcto :status success
    describe 'GET /posts' do
        it 'returns  all posts'do
            get 'http://localhost:3000/posts'
            expect(response).to have_http_status(:success)
        end
    end
    
    #describe 'GET /movies/:id' do
    #    it 'return single movie'do
    #        get 'http://localhost:3000/movies/1'
    #        expect(response).to have_http_status(:ok)
    #    end
    #end
end
