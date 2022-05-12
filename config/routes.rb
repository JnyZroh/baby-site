Rails.application.routes.draw do
  get 'questions', to: 'pages#questions'
  get '/', to: 'pages#home', as: :root
  resources :guests
  get 'new_sign_up', to: 'new_users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
