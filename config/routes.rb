Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :employees, param: :id, :defaults => { :format => 'json' }
  resources :company, :defaults => { :format => 'json' }
  resources :wage, :defaults => { :format => 'json' }
  resources :period, :defaults => { :format => 'json' }
  post '/auth/login', to: 'authentication#login', :defaults => { :format => 'json' }
  get '/*a', to: 'application#not_found'
end
