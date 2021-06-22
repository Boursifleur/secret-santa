Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :events, only: [:new, :create, :index, :show, :destroy, :update] do
    get 'starting_santa_sorting', to: 'events#starting_santa_sorting', as: 'sorting_participants'
  end
  resources :participants, only: [:index, :new, :create, :destroy]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
