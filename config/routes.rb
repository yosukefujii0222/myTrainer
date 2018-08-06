Rails.application.routes.draw do
  get 'user/new' => 'user#new'
  post 'user/create' => 'user#create'
  get 'user/userLogin' => 'user#userLogin'
  post 'userLogin' => 'user#login'

  get 'trainer/new' => 'trainer#new'
  post 'trainer/create' => 'trainer#create'
  get 'trainer/trainerLogin' => 'trainer#trainerLogin'
  post 'trainerLogin' => 'trainer#login'
  get '/' => 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
