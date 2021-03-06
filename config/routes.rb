Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'about', to: 'pages#about'
  get 'sponsors', to: 'pages#sponsors'
  get 'cgu', to: 'pages#cgu'
  get 'terms', to: 'pages#terms'
  get 'contact', to: 'pages#contact'
  get 'privacy', to: 'pages#privacy'
  get 'error', to: 'pages#error'
  resources :responses
  resources :posts
  resources :comments
  resources :messages
  resources :fields 
  resources :images, only: [:create]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }

  get '/:id', to: 'pages#profil', as: 'profile'

  notify_to :users, with_devise: :users, devise_default_routes: true
    devise_scope :user do
      authenticated :user do
        root :to => 'posts#index'
        delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_all_session
      end
      unauthenticated :user do
        root :to => 'devise/registrations#new', as: :unauthenticated_root
      end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
