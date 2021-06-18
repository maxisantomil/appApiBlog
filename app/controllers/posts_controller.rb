
class PostsController < ApplicationController
    before_action :authenticate, only: [:create,:index,:show,:update,:destroy] 
    #si o si autentificarse con token para poder realizar los siguientes endpoint

    rescue_from ActiveRecord::RecordNotFound, with: :not_found 
    MAX_PAGINATION_LIMIT = 5
    
    #GET: http://localhost:3000/posts
    def index 
            @posts = Post.limit(limit).offset(params[:offset])
                         #.where('title LIKE ?', "%#{params[:title]}%")
                         .order('date_creation DESC')
                          render json: @posts, each_serializer: PostSerializer


            #render json: @posts, only: [:id,:title,:url_image,:categories,:date_creation]    
    end

    def show
            @post = Post.find(params[:id])
            render json:@post, serializer: SinglePostSerializer
    end
  
    def new
        @post =  Post.new
    end

    # POST: http://localhost:3000/posts
    def create 
      
        if params[:categories].blank?
            render json: { message: "error, ingrese una categoria para el post" }
        else

            @post= Post.create(title: params[:title],
            content: params[:content],
            url_image: params[:url_image],
            date_creation: params[:date_creation],
            user:@user)

            @categories = params[:categories].map do |category|
                Category.create(
                    name: category[:name],
                )
            end
            @categories.each do |category|
                @post.categories << category
            end
        
        if @post.save
            render json: @post, status: :created, location: @post
        else
            render json: @post.errors, status: unprocessable_entity
        end
     end
    end

    def edit
        @post= Post.find(params[:id])
        render json:@post
    end

    #PATCH: http://localhost:3000/posts/:id
    def update
        @post= Post.find(params[:id])
        if @post.update(post_params)
           render json:@post
        else
            render json:@post.errors, status: unprocessable_entity
        end
    end

    #DELETE: http://localhost:3000/posts/:id
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: { message: "post: '#{params[:id]}' deleted" }, status: 200
    end

     #creo metodo privados
     private    
     def post_params
         params.require(:post).permit(:title, :content, :url_image, :date_creation, :user_id)
     end
 
    def limit
        [
            params.fetch(:limit,MAX_PAGINATION_LIMIT).to_i,
            MAX_PAGINATION_LIMIT
        ].min
    end
    def fetch_post
        Post.find_by!(params[:id])
    end

    def not_found
        render json: { message: "post: '#{params[:id]}' not found" }, status: 404
      end
end
