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
  
  devise_scope :user do  
   get '/users/sign_out' => 'devise/sessions#destroy'     
 end
end
