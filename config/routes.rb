Rails.application.routes.draw do

root "blogs#index"
  resources :blogs do
   member do 
    get "like" => "blogs#upvote" 
    get "dislike" => "blogs#downvote"
  end
end
  resources :comments

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
