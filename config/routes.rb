Rails.application.routes.draw do
  get '/search' => "search#search"
  post '/books/:book_id/favorites' => "favorites#create"
  delete '/books/:book_id/favorites' => "favorites#destroy"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#home"
  get "/" => "users#home"
  get "/home/about" => "users#about"
  get "/users/:id/follow" => "users#follow", as: 'follow'
  get "/users/:id/follower" => "users#follower", as: 'follower'

  get "chat/:id" => "chats#show", as: "chat"

resources :users, only:[:show, :edit, :update, :index]
resources :relationships, only: [:create, :destroy]
resources :chats, only: [:create]

resources :books do
	resources :book_comments, only:[:create, :destroy]
	resource :favorites, only:[:create, :destroy]
end

end
