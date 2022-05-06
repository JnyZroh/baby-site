Rails.application.routes.draw do
  get 'questions', to: 'pages#questions'
  get '/', to: 'pages#home'
  resources :guests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
