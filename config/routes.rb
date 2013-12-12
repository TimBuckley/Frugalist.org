Frugalistas::Application.routes.draw do
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]

  resources :messages, :only => [:create, :destroy, :new, :index, :show]

  resources :transactions
  resources :trusts

  root :to => "users#show"
end
