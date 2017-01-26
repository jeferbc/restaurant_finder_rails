Rails.application.routes.draw do
    get 'choose_city' => 'city#choose_city'
    get 'restaurants/index'
    get 'index' => 'restaurants#index'
    get 'get_city' => 'city#get_city'
    match '/', to: 'restaurants#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
    match '/', to: 'restaurants#index', constraints: { subdomain: "/.+/" }, via: [:get, :post, :put, :patch, :delete]
    root 'restaurants#index'
    resources :search, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
