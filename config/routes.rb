Rails.application.routes.draw do
  get 'questions', to: 'pages#questions'
  get '/', to: 'pages#home', as: :root
  resources :guests

  # post 'incoming/' => 'notifications#incoming'
  post '/new-text' => 'notifications#new'
  get '/notifications' => 'notifications#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
