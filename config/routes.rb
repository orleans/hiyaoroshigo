Rails.application.routes.draw do
  devise_for :drinker, controllers:{ omniauth_callbacks: "drinker/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :terms, only: [:show]
  get :signup, to: "devise/registrations#new"
  resources :festivals, only: [:index, :show]
  resources :restaurants, only: [:index, :show] do
    resources :sakes, only: [:index]
    resources :checkins, only: [:index, :create]
  end
  resources :drinkers, only: [:show, :edit, :update]
  resources :drinkings, only: [:index, :new, :create, :delete]
  get :itsitoolate, to: "festivals#itstoolate"
  get :thewinner, to: "festivals#thewinner"
end
