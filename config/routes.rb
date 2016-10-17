Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'lobbies#index'

  resources :students
  resources :games
  resources :teams

  resources :lobbies do
    collection do
      post :inlobby
      post :ingame
    end
  end

  resources :teachers do
    collection do
      post :increategame
      post :increatelobby
    end
  end

  # activate actioncable
  mount ActionCable.server => "/cable"
end
