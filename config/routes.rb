Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/sponsors'
  get 'pages/team'
  get 'pages/cgu'
  get 'pages/terms'
  resources :responses
  resources :posts
  resources :comments
  resources :messages
  resources :fields
  devise_for :users
    devise_scope :user do
      authenticated :user do
        root :to => 'posts#index'
      end
      unauthenticated :user do
        root :to => 'devise/registrations#new', as: :unauthenticated_root
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
