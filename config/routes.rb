Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks => 'callbacks' }
  
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  
  resources :artists do
    resources :albums
  end
  resources :albums, only: [:index]
  get 'albums/prog_rock', to: 'albums#prog_rock', as: :prog_rock
  root to: 'application#welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
