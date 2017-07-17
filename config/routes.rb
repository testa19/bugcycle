Rails.application.routes.draw do
  resources :bicycles, only: [:show, :index] do
    get :commit, :on => :member
    get :like, :on => :member
  end

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'logout', to: 'devise/sessions#destroy'
  end
  devise_for :user

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'bicycles#index'
end
