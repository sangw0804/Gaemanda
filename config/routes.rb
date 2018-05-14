Rails.application.routes.draw do

  get 'likes/update'

  devise_for :users
  resources :posts

  get 'home/show_user' => 'home#show_user' ,as: 'show_user'

  post 'like/update/:liker_id/:likee_id' => 'likes#update' , as: 'like_update'

  get 'user/profile/:user_id' => 'home#profile' , as: 'user_profile'

  root 'home#index'
end
