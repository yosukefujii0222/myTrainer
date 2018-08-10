Rails.application.routes.draw do
  get '/' => 'home#top'

  get 'user/new' => 'user#new'
  post 'user/create' => 'user#create'
  get 'user/userLogin' => 'user#userLogin'
  post 'userLogin' => 'user#login'
  post 'user/logout' => 'user#logout'

  get 'trainer/new' => 'trainer#new'
  post 'trainer/create' => 'trainer#create'
  get 'trainer/trainerLogin' => 'trainer#trainerLogin'
  post 'trainerLogin' => 'trainer#login'
  post 'trainer/logout' => 'trainer#logout'
  get 'trainer/search' => 'trainer#search'
  get 'trainer/:id' => 'trainer#show'
  get 'trainer/:id/edit' => 'trainer#edit'
  post 'trainer/:id/update' => 'trainer#update'
  get 'trainer/:id/manage' => 'trainer#manage'

  post "follower/:trainer_id/create" => "follower#create"
  post "follower/:trainer_id/:user_id/approve" => "follower#approve"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
