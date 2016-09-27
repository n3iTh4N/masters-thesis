Rails.application.routes.draw do
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'lobbies#index'

  resources :teachers
  resources :students
  resources :games
  resources :teams

  resources :lobbies do
    collection do
      post :inlobby
    end
  end

  # activate actioncable
  mount ActionCable.server => "/cable"
end
