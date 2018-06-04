require 'api_constraints'

MarketPlaceApi::Application.routes.draw do
  devise_for :users
  # Api definition
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
			resources :users, :only => [:show, :create, :update, :destroy] do
    # this is the line
      resources :products, :only => [:create, :update, :destroy]
      resources :orders, :only => [:index, :show, :create]
      end
      resources :sessions, :only => [:create, :destroy]
      resources :products, :only => [:show, :index]

    end
  end
end

