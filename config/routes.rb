Rails.application.routes.draw do

  devise_for :users
  resources :posts

  get 'home/show_user/:user_id' => 'home#show_user' ,as: 'show_user'

  get 'home/show_ajax' => 'home#show_ajax' ,as: 'show_ajax'

  post 'like/update/:liker_id/:likee_id' => 'likes#update' , as: 'like_update'

  delete 'like/delete/:liker_id/:likee_id' => 'likes#delete' , as: 'like_delete'

  get 'user/profile/:user_id' => 'home#profile' , as: 'user_profile'

  get 'posts/new/:match_id/:user_id/:likee_id' => 'posts#new', as: 'post_new_match'

  get 'home/index' => 'home#index'
  root 'home#start'
end
