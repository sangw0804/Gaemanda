Rails.application.routes.draw do

  devise_for :users
  resources :post

  get 'home/show_user/:user_id' => 'home#show_user' ,as: 'show_user'

  post 'like/update/:liker_id/:likee_id' => 'likes#update' , as: 'like_update'

  delete 'like/delete/:liker_id/:likee_id' => 'likes#delete' , as: 'like_delete'

  get 'user/profile/:user_id' => 'home#profile' , as: 'user_profile'

  root 'home#index'
end
