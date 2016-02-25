Rails.application.routes.draw do

  resources :customers

  resources :tickets do
    resources :attachments
    resources :comments
  end

  devise_for :users

  authenticated :user do
    root 'users#index'
  end

  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end

  resources :conversations do
    resources :messages
  end


end
