Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  #-----------------------------------------Post-----------------------------------------------------
 
   #me muestra todas las peliculas 
   get '/posts', to:'posts#index'
   get'/posts/new', to:'posts#new'
   post '/posts', to:'posts#create'
   #me muestra un post en particular con todos sus campos y categorias
   get'/posts/:id', to:'posts#show',as: 'post'
   get'/posts/:id/edit', to:'posts#edit',as:'edit_post'
   patch'/posts/:id', to:'posts#update'
   put'/posts/:id', to:'posts#update'
   delete'/posts/:id', to: 'posts#destroy'
   get '/posts/:id/categories', to:'posts#categories'

   #-----------------------------------------User-----------------------------------------------------
 
   #resources :users, only: [:create,:destroy]
   post '/auth/sign_up',to: 'users#create' 
   post 'users/login', to: 'users#login' 
   get 'users/auto_login', to: 'users#auto_login'
end
