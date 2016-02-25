Rails.application.routes.draw do

  resources :csrs
  resources :templates

  resources :customers

  resources :tickets do
    resources :attachments do
      member do
        get 'download'
      end
    end
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
