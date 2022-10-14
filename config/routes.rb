Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :employees, param: :_employeename
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
