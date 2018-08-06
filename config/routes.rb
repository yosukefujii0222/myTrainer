Rails.application.routes.draw do
  get 'user/new'

  get 'trainer/new' => 'trainer#new'
  post 'trainer/create' => 'trainer#create'
  get '/' => 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
