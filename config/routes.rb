Cuentas::Application.routes.draw do
  resources :payments

  resources :users
  resource :session
  
  root :to => "payments#index"
end
