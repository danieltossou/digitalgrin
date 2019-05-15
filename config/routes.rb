Rails.application.routes.draw do
  get 'about', to: 'pages#about'
  get 'sponsors', to: 'pages#sponsors'
  get 'team', to: 'pages#team'
  get 'cgu', to: 'pages#cgu'
  get 'terms', to: 'pages#terms'
  resources :responses
  resources :posts
  resources :comments
  resources :messages
  resources :fields
  devise_for :users
  notify_to :users, with_devise: :users, devise_default_routes: true
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
